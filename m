Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47876 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751769AbdJIHSD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Oct 2017 03:18:03 -0400
Date: Mon, 9 Oct 2017 09:17:43 +0200
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
Subject: Re: [PATCH 11/18] arm64: dts: ulcb-kf: enable USB2.0 Host channel 0
Message-ID: <20171009071742.GJ17360@verge.net.au>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737392-23269-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <CAMuHMdW9e-hSEHDbN9PNjLQHYdoXy6jFF=PgbCFb0neN_0Ho2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW9e-hSEHDbN9PNjLQHYdoXy6jFF=PgbCFb0neN_0Ho2Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 20, 2017 at 02:52:12PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 7, 2017 at 12:36 AM, Vladimir Barinov
> <vladimir.barinov@cogentembedded.com> wrote:
> > This supports USB2.0 Host channel 0 on ULCB Kingfisher board
> >
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.

There was some fuzz when doing so. Please check that what I have applied
is correct after I have pushed the next branch of the renesas tree a little
later today.
