# Contributing to MD2CV

Thank you for your interest in contributing to MD2CV!

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in [Issues](../../issues)
2. If not, create a new issue with:
   - Clear, descriptive title
   - Steps to reproduce
   - Expected vs actual behavior
   - Your environment (OS, Docker version, etc.)

### Suggesting Features

1. Open an issue with the `enhancement` label
2. Describe the feature and its use case
3. Provide examples if possible

### Adding a New Template

1. Create a new folder under `templates/` with your template name
2. Add two files:
   - `template.html` - Jinja2 HTML template
   - `style.css` - CSS styles
3. Use these Jinja2 variables:
   - `{{ meta.name }}` - Full name
   - `{{ meta.title }}` - Job title
   - `{{ meta.email }}`, `{{ meta.phone }}`, `{{ meta.location }}`
   - `{{ meta.linkedin }}`, `{{ meta.github }}`, `{{ meta.website }}`
   - `{{ content | safe }}` - Rendered markdown content
4. Submit a pull request

### Code Contributions

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Test with Docker: `docker build -t md2cv . && docker run ...`
5. Commit with clear messages
6. Push and create a pull request

## Code Style

- Python: Follow PEP 8
- Use meaningful variable names
- Add docstrings to functions and classes
- Keep templates clean and ATS-friendly

## Questions?

Open an issue with the `question` label.
