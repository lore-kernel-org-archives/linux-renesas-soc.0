Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:48259 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932422AbdJYK1D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Oct 2017 06:27:03 -0400
Received: by mail-wr0-f193.google.com with SMTP id 15so9651739wrb.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Oct 2017 03:27:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <80b63a20-1f04-8dc9-874f-434bf096ef0b@de.bosch.com>
References: <1447343686-2038-1-git-send-email-geert+renesas@glider.be>
 <1447343686-2038-6-git-send-email-geert+renesas@glider.be> <80b63a20-1f04-8dc9-874f-434bf096ef0b@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Oct 2017 12:27:01 +0200
Message-ID: <CAMuHMdXKk0SOFoputBX=C1vOVCUHQ6+61hwKPR=G04AZP4mUEw@mail.gmail.com>
Subject: Re: clk: r8a7795: Why to read EXTAL* from DT? (was: Re: [PATCH v6
 5/5] clk: shmobile: r8a7795: Add new CPG/MSSR driver)
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, Oct 25, 2017 at 8:12 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> today, I want to learn some history ;)
>
> On 12.11.2015 16:54, Geert Uytterhoeven wrote:
>> Add a new R-Car H3 Clock Pulse Generator / Module Standby and Software
>> Reset driver, using the new CPG/MSSR driver core.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>
> ...
>>
>> diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
>> b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
>> new file mode 100644
>> index 0000000000000000..57c413635d1af135
>> --- /dev/null
>> +++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
>
> ...
>>
>> +static const struct cpg_core_clk r8a7795_core_clks[] __initconst = {
>> +       /* External Clock Inputs */
>> +       DEF_INPUT("extal",  CLK_EXTAL),
>> +       DEF_INPUT("extalr", CLK_EXTALR),
>
> Why do we read the extal* frequencies from DT and don't auto detect them
> based on the MD pins?

Because the input frequency is determined by the EXTAL.
The MD pins define which dividers are used. So knowing both allows to calculate
the real frequencies of all generated clocks. People may populate different
crystals that supported officially.

> Yesterday, I spent two hours debugging a clock issue due to a wrong DT
> because the hardware guys populated a different EXTAL oscillator. I would
> have saved this time if it would have been auto detected.

That's actually the issue the code wanted to solve: on R-Car H3 ES1.0, there
are missing post-dividers on PLL0/2/4, cfr. the PLL_ERRATA flag in the driver.
To work around that, and avoid overclocking e.g. the CPU cores, the EXTAL
frequency and MD pin configuration don't match on Salvator-X with H3 ES1.0
(EXTAL is half the expected frequency according to the MD pins).

Conclusion: make sure your hardware description in DT is correct :-)

P.S. On R-Car Gen2, we used to "guess" extal from the MD pins in some
places, but that was changed. See e.g. commit 9f5ce39ddb8f68b3 ("ARM:
shmobile: rcar-gen2: Obtain extal frequency from DT").

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
