Return-Path: <na-hoan@jinso.co.jp>
Subject: Re: [v2 PATCH] thermal: rcar_gen3_thermal: Fix init value of IRQCTL
 register
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        wsa@sang-engineering.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, cv-dong@jinso.co.jp
References: <1540433621-24114-1-git-send-email-na-hoan@jinso.co.jp>
 <20181105140913.GA461@bigcity.dyn.berto.se>
From: Hoan <na-hoan@jinso.co.jp>
Message-ID: <9343e7ef-e20a-b60e-b0f6-0b86662fee3a@jinso.co.jp>
Date: Tue, 6 Nov 2018 11:18:17 +0900
MIME-Version: 1.0
In-Reply-To: <20181105140913.GA461@bigcity.dyn.berto.se>
Content-Type: multipart/alternative;
 boundary="------------EF64864203355EEADDBDA7E0"
Content-Language: en-US
List-ID: <linux-renesas-soc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------EF64864203355EEADDBDA7E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Niklas-san

Thank you for your review!

On 2018/11/05 23:09, Niklas Söderlund wrote:
> Hi Hoan-san,
>
> Thanks for your patch.
>
> On 2018-10-25 11:13:41 +0900, Nguyen An Hoan wrote:
>> From: Hoan Nguyen An <na-hoan@jinso.co.jp>
>>
>> Fix setting value for IRQCTL register. We are setting the last 6 bits
>> of (IRQCTL) to be 1 (0x3f), this is only suitable for H3ES1.*, according
>> to new Hardware manual values 1 are "setting prohibited" for Gen3!
> Hum, as you point out this change is not suitable for H3 ES1.x so this
> would introduce a regression, which is not good. I will leave the final
> word to Wolfram but in my view you need to introduce quirk handling to
> keep support for H3 ES1.x or blacklist that SoC in the driver.

With this patch and current state of the Gen3 thermal driver, H3ES1.* is 
still correctly supported.

     priv->thermal_init = rcar_gen3_thermal_init;
     if (soc_device_match(r8a7795es1))
         priv->thermal_init = rcar_gen3_thermal_init_r8a7795es1;

General common Gen3(H3, M3) and H3ES1. * using two different 
thermal_init（） function.

As the v1 of this patch

"https://patchwork.kernel.org/patch/10654457/"

I was  to change the init_r8a7795es1() function, but then test again

(I used the patch that improves interrupts for testing) and realized

(The count of interrupts  rising or falling temperature)
Unstable with H3ES1.1! So I update v2

I also have re-read the Hardware Manual,

with Rev0.5 is consistent with ES1 , but  Since Rev0.8 or Rev1.0 HWM is 
not compatible with H3ES1.

So that this update will be correct and consistent with 
rcar_gen3_thermal_init.
H3ES1.1 is already supported correctly at rcar_gen3_thermal_init_r8a7795es1!

I'm still thinking this change is correct! Thank you very much :-)

Hoan.

>> Signed-off-by: Hoan Nguyen An <na-hoan@jinso.co.jp>
>> ---
>>   drivers/thermal/rcar_gen3_thermal.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
>> index 7aed533..fde3fd8 100644
>> --- a/drivers/thermal/rcar_gen3_thermal.c
>> +++ b/drivers/thermal/rcar_gen3_thermal.c
>> @@ -306,7 +306,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
>>   
>>   	usleep_range(1000, 2000);
>>   
>> -	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
>> +	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
>>   	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
>>   	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
>>   
>> -- 
>> 2.7.4
>>

--------------EF64864203355EEADDBDA7E0
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Dear Niklas-san</p>
    <p>Thank you for your review!<br>
    </p>
    <div class="moz-cite-prefix">On 2018/11/05 23:09, Niklas Söderlund
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20181105140913.GA461@bigcity.dyn.berto.se">
      <pre class="moz-quote-pre" wrap="">Hi Hoan-san,

Thanks for your patch.

On 2018-10-25 11:13:41 +0900, Nguyen An Hoan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Hoan Nguyen An <a class="moz-txt-link-rfc2396E" href="mailto:na-hoan@jinso.co.jp">&lt;na-hoan@jinso.co.jp&gt;</a>

Fix setting value for IRQCTL register. We are setting the last 6 bits
of (IRQCTL) to be 1 (0x3f), this is only suitable for H3ES1.*, according
to new Hardware manual values 1 are "setting prohibited" for Gen3!
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hum, as you point out this change is not suitable for H3 ES1.x so this 
would introduce a regression, which is not good. I will leave the final 
word to Wolfram but in my view you need to introduce quirk handling to 
keep support for H3 ES1.x or blacklist that SoC in the driver.
</pre>
    </blockquote>
    <p>With this patch and current state of the Gen3 thermal driver,
      H3ES1.* is still correctly supported.</p>
    <p><font size="-1">    priv-&gt;thermal_init =
        rcar_gen3_thermal_init;<br>
            if (soc_device_match(r8a7795es1))<br>
                priv-&gt;thermal_init =
        rcar_gen3_thermal_init_r8a7795es1;</font></p>
    <p>General common Gen3(H3, M3) and H3ES1. * using two different
      thermal_init（） function.</p>
    <p>As the v1 of this patch <br>
    </p>
    <p><a class="moz-txt-link-rfc2396E" href="https://patchwork.kernel.org/patch/10654457/">"https://patchwork.kernel.org/patch/10654457/"</a></p>
    <p>I was  to change the init_r8a7795es1() function, but then test
      again</p>
    <p>(I used the patch that improves interrupts for testing) and
      realized <br>
    </p>
    <p>(The count of interrupts  rising or falling temperature)<br>
      Unstable with H3ES1.1! So I update v2</p>
    <p>I also have re-read the Hardware Manual,</p>
    <p>with Rev0.5 is consistent with ES1 , but  Since Rev0.8 or Rev1.0
      HWM is not compatible with H3ES1.</p>
    <p>So that this update will be correct and consistent with
      rcar_gen3_thermal_init.<br>
      H3ES1.1 is already supported correctly at
      rcar_gen3_thermal_init_r8a7795es1!</p>
    <p>I'm still thinking this change is correct! Thank you very much <span
        class="moz-smiley-s1"><span>:-)</span></span></p>
    <p>Hoan.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20181105140913.GA461@bigcity.dyn.berto.se">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Signed-off-by: Hoan Nguyen An <a class="moz-txt-link-rfc2396E" href="mailto:na-hoan@jinso.co.jp">&lt;na-hoan@jinso.co.jp&gt;</a>
---
 drivers/thermal/rcar_gen3_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 7aed533..fde3fd8 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -306,7 +306,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 
 	usleep_range(1000, 2000);
 
-	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
+	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN, IRQ_TEMPD1 | IRQ_TEMP2);
 
-- 
2.7.4

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EF64864203355EEADDBDA7E0--
