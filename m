Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44237 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754206AbdFNIzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jun 2017 04:55:03 -0400
Date: Wed, 14 Jun 2017 10:54:57 +0200
From: Simon Horman <horms@verge.net.au>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Subject: Re: [PATCH 2/2] ARM: shmobile: pm-rmobile: Use GENPD_FLAG_ALWAYS_ON
Message-ID: <20170614085457.GC26958@verge.net.au>
References: <1497259427-8299-1-git-send-email-geert+renesas@glider.be>
 <1497259427-8299-3-git-send-email-geert+renesas@glider.be>
 <CAPDyKFoeu2uJxFKYN1M46Nm9mVy3aeN_zdKwEhjPf7VmTW+3QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFoeu2uJxFKYN1M46Nm9mVy3aeN_zdKwEhjPf7VmTW+3QA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 12, 2017 at 02:27:53PM +0200, Ulf Hansson wrote:
> On 12 June 2017 at 11:23, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Improve handling of always-on PM domains by using the
> > GENPD_FLAG_ALWAYS_ON flag introduced in commit ffaa42e8a40b7f10 ("PM /
> > Domains: Enable users of genpd to specify always on PM domains").
> >
> > Note that the PM domain containing the serial console is still handled
> > locally.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks, I have queued this up for v4.13.
