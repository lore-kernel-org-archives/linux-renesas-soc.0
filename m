Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47788 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751068AbdJIHQd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 03:16:33 -0400
Date: Mon, 9 Oct 2017 09:16:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 14/18] arm64: dts: ulcb-kf: enable TCA9539 on I2C2
Message-ID: <20171009071613.GF17360@verge.net.au>
References: <1507257845-12106-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdWBy6FZ7Ha5d_gc=r27N-mHMMK9shNDzRLRM3NnUXY-wQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWBy6FZ7Ha5d_gc=r27N-mHMMK9shNDzRLRM3NnUXY-wQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 06, 2017 at 09:17:45AM +0200, Geert Uytterhoeven wrote:
> On Fri, Oct 6, 2017 at 4:44 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > This supports TCA9539 gpio expanders on I2C2 bus on ULCB Kingfisher board
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
