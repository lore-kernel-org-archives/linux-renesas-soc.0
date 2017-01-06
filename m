Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54819 "EHLO
        galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752276AbdAFOmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 09:42:50 -0500
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jithin T Raj <jithin.t@tataelxsi.co.in>
Cc: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "laurent.pinchart+renesas@ideasonboard.com"
        <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: About VSPD
Date: Fri, 06 Jan 2017 16:42:54 +0200
Message-ID: <2306529.eAzpfA7p5A@avalon>
In-Reply-To: <HK2PR04MB122088542BF30F00286A7C30D8630@HK2PR04MB1220.apcprd04.prod.outlook.com>
References: <HK2PR04MB122088542BF30F00286A7C30D8630@HK2PR04MB1220.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Jithin,

On Friday 06 Jan 2017 07:15:27 Jithin T Raj wrote:
> hello Laurent and all,
> 
> Can anybody give me an insight to VSPD .Recently I am going through
> the term VSPD..Is it associated with Display Unit ? ..It will be a help if
> someone share some links about VSPD..I am a beginner in both kernel and
> RCar families..

The VSP is a memory-to-memory image processor than can perform operations such 
as format conversion, scaling, blending, ... There are multiple VSP instances 
on R-Car Gen2 and Gen3 SoCs, whose number and features depend on the 
particular SoC. The VSPD is a VSP type designed for display operation that can 
feed its output directly to the display in addition to writing it to memory 
like all other VSPs. On R-Car Gen3 SoCs usage of the VSPD for display is 
mandatory, so the VSPD is handled automatically by the DU driver and isn't 
visible to userspace. On R-Car Gen2 SocS usage of the VSPD for display os 
optional, so the VSPD is exposed to userspace through the V4L2 API. Connecting 
the VSPD output directly to the display on R-Car Gen2 currently requires out-
of-tree patches (see 
http://comments.gmane.org/gmane.comp.video.dri.devel/127526).

-- 
Regards,

Laurent Pinchart
