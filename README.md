# MD2CV

> Convert Markdown resumes to ATS-friendly PDF and DOCX formats

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)](Dockerfile)

## Features

- **Markdown + HTML** - Write your CV in Markdown with optional HTML support
- **Multiple Templates** - Choose from ATS-optimized themes
- **PDF & DOCX Export** - Generate both formats with one command
- **YAML Frontmatter** - Store contact info and metadata separately
- **Docker Support** - No dependency headaches

## Quick Start

### Using Docker (Recommended)

```bash
# Build the image
docker build -t md2cv .

# Convert your CV
docker run --rm \
  -v "$(pwd)/examples:/app/examples:ro" \
  -v "$(pwd)/templates:/app/templates:ro" \
  -v "$(pwd)/output:/app/output" \
  md2cv examples/template_cv.md --format all
```

### Output

Files are saved to `output/`:
- `your_cv.pdf`
- `your_cv.docx`

## Writing Your CV

### 1. Copy the Template

```bash
cp examples/template_cv.md my_resume.md
```

### 2. Edit Your CV

```markdown
---
name: "John Doe"
title: "Software Engineer"
email: "john@example.com"
phone: "+1 555 123 4567"
location: "San Francisco, CA"
linkedin: "linkedin.com/in/johndoe"
github: "github.com/johndoe"
---

# Professional Summary

Your summary here...

# Work Experience

## Job Title
**Company** | Location | Date Range

- Achievement 1
- Achievement 2
```

### 3. Convert

```bash
docker run --rm \
  -v "$(pwd):/app/input:ro" \
  -v "$(pwd)/templates:/app/templates:ro" \
  -v "$(pwd)/output:/app/output" \
  md2cv /app/input/my_resume.md --format all
```

## Templates

| Template | Description |
|----------|-------------|
| `ats_classic` | Traditional, ATS-optimized (default) |
| `modern` | Contemporary with blue accents |
| `minimal` | Clean, simple layout |

```bash
# Use a specific template
md2cv my_resume.md --template modern
```

## CLI Options

| Option | Description |
|--------|-------------|
| `--format pdf` | Export PDF only |
| `--format docx` | Export DOCX only |
| `--format all` | Export both (default) |
| `--template NAME` | Choose template |
| `--list-templates` | Show available templates |

## Adding Custom Templates

1. Create a folder under `templates/`:
   ```bash
   mkdir templates/my_theme
   ```

2. Add two files:
   - `template.html` - Jinja2 template
   - `style.css` - Your styles

3. Use Jinja2 variables:
   - `{{ meta.name }}`, `{{ meta.email }}`, etc.
   - `{{ content | safe }}` - Rendered markdown

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Project Structure

```
md2cv/
├── converter.py        # Main converter script
├── Dockerfile          # Docker configuration
├── templates/          # CV templates
│   ├── ats_classic/
│   ├── modern/
│   └── minimal/
├── examples/
│   └── template_cv.md  # Sample CV template
└── output/             # Generated files
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

MIT License - see [LICENSE](LICENSE) for details.
