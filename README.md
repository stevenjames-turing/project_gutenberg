<div id="top"></div>

# Project Gutenberg

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#getting-started">Getting Started</a></li>
    <li>
      <a href="#api-info">API Info</a>
      <ul>
        <li><a href="#exposed">Exposed</a></li>
      </ul>
    </li>
  </ol>
</details>

## Getting Started

1. Fork and Clone the repo: [GitHub: stevenjames-turing/project_gutenberg](https://github.com/stevenjames-turing/project_gutenberg)
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:{create,migrate}`
4. Run Rake file: `rake all`
    
<p align="right">(<a href="#top">back to top</a>)</p>

## API Info:
  ### Exposed:
  
- **Total Book Word-Pair Count**: 
  - `GET [https://project-gutenberg.herokuapp.com/api/v1/books?word_pair=<FIRST_WORD>,<SECOND_WORD>](https://project-gutenberg.herokuapp.com/api/v1/books?word_pair=molly,molly)
  - Example Response
    ```
      GET https://project-gutenberg.herokuapp.com/api/v1/books?word_pair=molly,molly
      {
        "data": {
            "id": "null",
            "type": "book",
            "attributes": {
                "word_pairing": {
                    "word_pairing": "molly,molly",
                    "total_count": 3
              }
            }
          }
        }
    ```
    
<p align="right">(<a href="#top">back to top</a>)</p>

