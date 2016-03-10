Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <9850717.l0t66FzFha@avalon>
References: <1457551122-21838-1-git-send-email-geert+renesas@glider.be>
	<1457551122-21838-4-git-send-email-geert+renesas@glider.be>
	<9850717.l0t66FzFha@avalon>
Date: Thu, 10 Mar 2016 09:26:34 +0100
Message-ID: <CAMuHMdVy1eY1t55NSmdkJ=haFEPYWoTReecOOK-63XaJj6ztew@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] soc: renesas: Add r8a7790 SYSC PM Domain Binding Definitions
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Mar 10, 2016 at 7:57 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> --- /dev/null
>> +++ b/include/dt-bindings/power/r8a7790-sysc.h
>> @@ -0,0 +1,31 @@

>> +#define R8A7790_PD_SH                        16
>
> The power domain is called SH-4A in the datasheet, how about naming it
> R8A7790_PD_SH_4A ?

Thanks, wlll update (for all SoCs).

> Apart from that,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>> +#define R8A7790_PD_RGX                       20
>> +#define R8A7790_PD_CA7_SCU           21
>> +#define R8A7790_PD_IMP                       24

Then this has to become R8A7790_PD_IMP_X4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
