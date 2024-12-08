---
slug: "contact"
date: 2024-02-11T18:39:38+01:00
draft: false
translationKey: "contact"
---

- Email: kirk.easterson [at] gmail [dot] com

{{< rawhtml >}}

<div>
  <iframe name="dummyframe" id="dummyframe" style="display: none;"></iframe>
  <form action="https://www.formbackend.com/f/e8735610eb4ef3dd" target="dummyframe" method="POST">
    <div>
		<label for="name">Name</label>
      <input type="text" id="name" name="name" required />
    </div>

    <div>
    	<label for="email">Email</label>
      <input type="email" id="email" name="email" required />
    </div>

    <div>
    	<label for="message">Message</label>
      <textarea type="text" id="message" name="message" required></textarea
    </div>

    <div>
        <button type="submit" onclick="showThankYou">Submit</button>
    </div>

    <div>
        <p id="thankyou" style="visibility: hidden"> Thank you! </p>
    </div>
    <script>
        function showThankYou(){
            document.getElementById("thankyou").style.visibility = "visible";
        }
    </script>
  </form>
</div>
{{< /rawhtml >}}
