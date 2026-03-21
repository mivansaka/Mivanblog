#!/bin/bash

# Jekyll to Hugo post migration script
# Converts Jekyll posts to Hugo format

OLD_BLOG="/Users/mivansaka/Downloads/mivansaka.github.io-master"
NEW_BLOG="/Users/mivansaka/Documents/blog"
POSTS_DIR="$OLD_BLOG/_posts"
TARGET_DIR="$NEW_BLOG/content/posts-archive"

echo "🔄 Starting post migration..."

# Create target directory
mkdir -p "$TARGET_DIR"

# Count posts
total_posts=$(ls "$POSTS_DIR" | grep -E '\.(md|markdown)$' | wc -l | tr -d ' ')
echo "📝 Found $total_posts posts to migrate"

# Counter
converted=0
failed=0

# Process each post
for file in "$POSTS_DIR"/*.{md,markdown}; do
    # Check if file exists (glob might not match)
    [ -f "$file" ] || continue

    filename=$(basename "$file")

    # Extract date and title from filename
    # Format: YYYY-MM-DD-title.md or YYYY-MM-DD-title.markdown
    if [[ $filename =~ ^([0-9]{4}-[0-9]{2}-[0-9]{2})-(.+)\.(md|markdown)$ ]]; then
        date="${BASH_REMATCH[1]}"
        title_slug="${BASH_REMATCH[2]}"

        # Read the file
        content=$(cat "$file")

        # Extract frontmatter
        if [[ $content =~ ^\-\-\-$(.*)^\-\-\-(.*)$ ]]; then
            frontmatter="${BASH_REMATCH[1]}"
            body="${BASH_REMATCH[2]}"

            # Extract title from frontmatter or use filename
            post_title=$(echo "$frontmatter" | grep "^title:" | sed 's/title: *//; s/^["'"'"']//; s/["'"'"']$//')

            # Extract date from frontmatter or use filename date
            post_date=$(echo "$frontmatter" | grep "^date:" | sed 's/date: *//')

            # If no title in frontmatter, use slug
            if [ -z "$post_title" ]; then
                post_title="$title_slug"
            fi

            # If no date in frontmatter, use filename date
            if [ -z "$post_date" ]; then
                post_date="${date} 12:00:00"
            fi

            # Convert date format for Hugo (YYYY-MM-DDTHH:MM:SS+08:00)
            hugo_date="${date}T12:00:00+08:00"

            # Create new filename
            new_filename="${date}-${title_slug}.md"

            # Build Hugo frontmatter
            cat_frontmatter="---
title: \"${post_title}\"
date: ${hugo_date}
draft: false
---
"

            # Write to new file
            echo "$cat_frontmatter" > "$TARGET_DIR/$new_filename"
            echo "$body" >> "$TARGET_DIR/$new_filename"

            ((converted++))
            echo "✅ Converted: $new_filename"
        else
            echo "⚠️  Skipped (no frontmatter): $filename"
            ((failed++))
        fi
    fi
done

echo ""
echo "📊 Migration complete!"
echo "   ✅ Converted: $converted"
echo "   ⚠️  Failed: $failed"
echo "   📁 Location: $TARGET_DIR"
