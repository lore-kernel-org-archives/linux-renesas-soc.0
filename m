Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3535519.g4KL1PCIZy@avalon>
References: <1455571020-18968-1-git-send-email-geert+renesas@glider.be>
	<1455571020-18968-5-git-send-email-geert+renesas@glider.be>
	<3535519.g4KL1PCIZy@avalon>
Date: Fri, 26 Feb 2016 16:41:27 +0100
Message-ID: <CAMuHMdVo2V7Ez5g8ZW74w-QWiwS8i2mbYeCjOU9brxRzNjMAdg@mail.gmail.com>
Subject: Re: [PATCH/RFC v2 04/11] soc: renesas: rcar: Add DT support for SYSC
 PM domains
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Feb 15, 2016 at 11:51 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>>  drivers/soc/renesas/pm-rcar.c | 327 +++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 327 insertions(+)
>>
>> diff --git a/drivers/soc/renesas/pm-rcar.c b/drivers/soc/renesas/pm-rcar.c
>> index cc684e9cc8db5d1c..c0540934126e58eb 100644
>> --- a/drivers/soc/renesas/pm-rcar.c
>> +++ b/drivers/soc/renesas/pm-rcar.c

>> +static int __init rcar_init_pm_domains(void)
>> +{
>> +     const struct of_device_id *match;
>> +     struct device_node *np, *pmd;
>> +     bool scanned = false;
>> +     void __iomem *base;
>> +     int ret = 0;
>> +
>> +     for_each_matching_node_and_match(np, rcar_sysc_matches, &match) {
>> +             u32 syscier = 0;
>> +
>> +             rcar_gen = (uintptr_t)match->data;
>> +
>> +             base = of_iomap(np, 0);
>> +             if (!base) {
>> +                     pr_warn("%s cannot map reg 0\n", np->full_name);
>> +                     continue;
>> +             }
>> +
>> +             rcar_sysc_base = base;  // FIXME conflicts with rcar_sysc_init()
>> +
>> +             pmd = of_get_child_by_name(np, "pm-domains");
>> +             if (!pmd) {
>> +                     pr_warn("%s lacks pm-domains node\n", np->full_name);
>
> Shouldn't you call iounmap() here ?

Yes. Will fix.

>> +             /*
>> +              * Enable all interrupt sources, but do not use interrupt
>> +              * handler
>> +              */
>> +             pr_debug("%s: syscier = 0x%08x\n", np->full_name, syscier);
>> +             iowrite32(syscier, rcar_sysc_base + SYSCIER);
>> +             iowrite32(0, rcar_sysc_base + SYSCIMR);
>
> Shouldn't the SYSCIMR bits be set to 1 to mask interrupts ?

That would work, too. It doesn't matter much, as the driver doesn't use
interrupts, so they stay disabled at the GIC level.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
