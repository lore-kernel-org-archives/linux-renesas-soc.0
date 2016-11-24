Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:54846 "EHLO
        cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935292AbcKXBKI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Nov 2016 20:10:08 -0500
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
To: Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: dt: Add support for r8a7743 and r8a7745
Date: Thu, 24 Nov 2016 02:17:54 +0100
Message-ID: <2982180.JIdENVDWHj@vostro.rjw.lan>
In-Reply-To: <20161116100906.GA20987@vireshk-i7>
References: <1479290751-9705-1-git-send-email-geert+renesas@glider.be> <20161116100906.GA20987@vireshk-i7>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wednesday, November 16, 2016 03:39:06 PM Viresh Kumar wrote:
> On 16-11-16, 11:05, Geert Uytterhoeven wrote:
> > Add the compatible strings for supporting the generic cpufreq driver on
> > the Renesas RZ/G1M (r8a7743) and RZ/G1E (r8a7745) SoCs.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Support for RZ/G1M and RZ/G1E is expected to land in v4.10.
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied.

Thanks,
Rafael
