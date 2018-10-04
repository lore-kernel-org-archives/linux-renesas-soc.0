Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46035 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbeJDQzG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 12:55:06 -0400
Date: Thu, 4 Oct 2018 12:02:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: Re: [PATCH] thermal: rcar_thermal: fix duplicate IRQ request
Message-ID: <20181004100229.alf4s4eqjdixtklz@verge.net.au>
References: <34a21e56-22b0-3603-1aba-0800aa02eff7@cogentembedded.com>
 <CAMuHMdWSvrqe38gXtjNiu7VXiy0sNHLuMi0ySg+A8iBR-FXdkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWSvrqe38gXtjNiu7VXiy0sNHLuMi0ySg+A8iBR-FXdkQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 04, 2018 at 09:15:57AM +0200, Geert Uytterhoeven wrote:
> CC Kaneko-san,
> 
> On Wed, Oct 3, 2018 at 10:47 PM Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > The driver on R8A77995 requests the same IRQ twice since
> > platform_get_resource() is always called for the 1st IRQ resource.
> >
> > Fixes: 1969d9dc2079 ("thermal: rcar_thermal: add r8a77995 support")
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Nice catch!
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
