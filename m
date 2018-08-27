Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:54935 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727005AbeH0XFD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 19:05:03 -0400
Date: Mon, 27 Aug 2018 21:16:56 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: renesas: r8a77965: Add CAN{0,1}
 placeholder nodes
Message-ID: <20180827191656.GA18631@vmlxhi-102.adit-jv.com>
References: <20180812133149.7710-1-erosca@de.adit-jv.com>
 <20180812133149.7710-5-erosca@de.adit-jv.com>
 <d4a8767c-8d98-859d-1dce-210e1f95fcec@ideasonboard.com>
 <CAMuHMdVz3q8PC+6hkQrn4aapGj3RqcwhOweOYYvs6Cw9ht3pKw@mail.gmail.com>
 <bd410bcb-bba9-a68e-f7bd-e67a94a52bae@cogentembedded.com>
 <CAMuHMdW41s4WXe0=w9xX98TBjskLkGXm+EA+2=UxNJk6cJwXMQ@mail.gmail.com>
 <20180823171425.GA7439@vmlxhi-102.adit-jv.com>
 <6e6409f1-35a0-4bf0-f9d7-35581fd6ba59@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6e6409f1-35a0-4bf0-f9d7-35581fd6ba59@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

I appreciate the detailed reply zooming in into many aspects (both
technical and related to process/workflow) of contributing/reviewing
patches. I take it as is. I could elaborate on specific parts of it,
like applying the "undefined behavior" term (which comes from the world
of compilers) to the software we write. This doesn't sound right to me,
since our software is guided by our own requirements and one of this
requirements is (should be) predictable and safe behavior given some
junky/incomplete DTS configuration. If any bugs exist dealing with
nonsense configuration, IMHO they should be fixed in the driver. Since
my purpose is simply seeing the patches in upstream the way maintainers
like them best, I will put little to no time discussing this and will
mainly focus on submitting any changes requested by the reviewers.

Thanks,
Eugeniu.
