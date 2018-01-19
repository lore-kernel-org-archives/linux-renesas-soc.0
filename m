Subject: Re: [PATCH 4/6] arm64: renesas: draak: enable I2C controller 0 and
 EEPROM
Cc: Simon Horman <horms@verge.net.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Wolfram Sang <wsa@the-dreams.de>, Magnus Damm <magnus.damm@gmail.com>,
 Linux I2C <linux-i2c@vger.kernel.org>
References: <1510759526-30346-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1510759526-30346-5-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdWmZEoNGRjsumOc+yPe3JTCBobVZd8arzUfcymjF0imDA@mail.gmail.com>
 <20171117143120.ayattgah6q54425c@verge.net.au>
 <20171117163939.q7jlx6d56zc5fli3@verge.net.au>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <1b72df38-1185-a046-65ae-7f8515d50e8f@ideasonboard.com>
Date: Fri, 19 Jan 2018 10:34:03 +0000
MIME-Version: 1.0
In-Reply-To: <20171117163939.q7jlx6d56zc5fli3@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On 17/11/17 16:39, Simon Horman wrote:
> On Fri, Nov 17, 2017 at 06:31:21AM -0800, Simon Horman wrote:
>> On Thu, Nov 16, 2017 at 10:27:56AM +0100, Geert Uytterhoeven wrote:
>>> Hi Ulrich,
>>>
>>> On Wed, Nov 15, 2017 at 4:25 PM, Ulrich Hecht
>>> <ulrich.hecht+renesas@gmail.com> wrote:
>>>> Enables EEPROM on I2C0 on the Draak board.
>>>>
>>>> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
>>>> +++ b/arch/arm64/boot/dts/renesas/r8a77995-draak.dts
>>>
>>>> @@ -67,6 +72,18 @@
>>>>         };
>>>>  };
>>>>
>>>> +&i2c0 {
>>>> +       pinctrl-0 = <&i2c0_pins>;
>>>> +       pinctrl-names = "default";
>>>> +       status = "okay";
>>>> +
>>>> +       eeprom@50 {
>>>> +               compatible = "atmel,24c01";
>>>
>>> This is actually a ROHM Semiconductor BR24T01FVM-W, so it should be
>>>
>>>         compatible = "rohm,br24t01", "atmel,24c01";
>>
>> Applied with the above change.
> 
> Sorry, I was a bit hasty there as this patch
> depends on a patch earlier in the series which I have not applied.
> 
> I've dropped this patch for now and will wait a bit longer for the review
> to unfold.
> 

I am dependant upon this patch for my Draak-D3 work.

Would you be able to consider the comments mentioned to progress this patch please?

--
Regards

Kieran


>>
>>> Please also submit a patch to add that compatible value to
>>> Documentation/devicetree/bindings/eeprom/eeprom.txt.
>>
>> Ulrich, please follow-up on this, thanks!
>>
>>> With the above fixed:
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> Gr{oetje,eeting}s,
>>>
>>>                         Geert
>>>
>>> --
>>> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>>>
>>> In personal conversations with technical people, I call myself a hacker. But
>>> when I'm talking to journalists I just say "programmer" or something like that.
>>>                                 -- Linus Torvalds
>>>
>>
