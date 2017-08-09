Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 9 Aug 2017 11:09:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Chris Paterson <Chris.Paterson2@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] ARM: shmobile: document iWave's
 iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development platform
Message-ID: <20170809090918.GO2705@verge.net.au>
References: <cover.1502190772.git.fabrizio.castro@bp.renesas.com>
 <TY1PR06MB07023F6BECCA3E86D00EBE23B78A0@TY1PR06MB0702.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR06MB07023F6BECCA3E86D00EBE23B78A0@TY1PR06MB0702.apcprd06.prod.outlook.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 08, 2017 at 02:14:50PM +0000, Chris Paterson wrote:
> + linux-renesas-soc

Thanks Chris,

I would not have seen these patches otherwise.

Fabrizio,

these patches seem find to me.
Please repost them with myself and linux-renesas-soc@vger.kernel.org CCed
so they hit the patchwork of that ML and I can apply them.

Please add any "Acked-by" or other tags that you may have received -
patchwork can't currently see them either.

I would also consider dropping the CC of linux-kernel@vger.kernel.org,
there is no need to circulate these patches there.



> 
> > From: Fabrizio Castro [mailto:fabrizio.castro@bp.renesas.com]
> > Sent: 08 August 2017 13:28
> > To: robh+dt@kernel.org; mark.rutland@arm.com
> > 
> > Hello,
> > 
> > This series aims to add the documentation for the device tree bindings of the
> > iWave iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development kit:
> > http://www.iwavesystems.com/product/development-platform/sodimm-
> > evaluation-boards/rz-g1e-sodimm-development-kit-28/rz-g1e-sodimm-
> > development-kit.html
> > 
> > which consists of a System on Module (iW-RainboW-G22M-SM) and a carrier
> > card (iW-RainboW-G22D).
> > 
> > Regards,
> > 
> > Fabrizio Castro (2):
> >   ARM: shmobile: document iW-RainboW-G22M-SM SODIMM System on
> > Module
> >   ARM: shmobile: document iW-RainboW-G22D SODIMM SOM Development
> >     Platform
> > 
> >  Documentation/devicetree/bindings/arm/shmobile.txt | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > --
> > 1.9.1
> 
