Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVy1eY1t55NSmdkJ=haFEPYWoTReecOOK-63XaJj6ztew@mail.gmail.com>
References: <1457551122-21838-1-git-send-email-geert+renesas@glider.be>
	<1457551122-21838-4-git-send-email-geert+renesas@glider.be>
	<9850717.l0t66FzFha@avalon>
	<CAMuHMdVy1eY1t55NSmdkJ=haFEPYWoTReecOOK-63XaJj6ztew@mail.gmail.com>
Date: Thu, 24 Mar 2016 16:35:30 +0100
Message-ID: <CAMuHMdX_Aw=HqJHEpyPdg3qBpReTA0jLk60BGhhdiF=Bf5JV1w@mail.gmail.com>
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

On Thu, Mar 10, 2016 at 9:26 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>>> +#define R8A7790_PD_IMP                       24
>
> Then this has to become R8A7790_PD_IMP_X4.

Actually this bit is called IMP, so I'll keep it.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
