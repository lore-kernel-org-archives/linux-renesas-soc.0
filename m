Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34485 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751564AbcKPM5b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 07:57:31 -0500
Date: Wed, 16 Nov 2016 13:57:23 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: dt: Add support for r8a7743 and r8a7745
Message-ID: <20161116125723.GC3039@verge.net.au>
References: <1479290751-9705-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479290751-9705-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 16, 2016 at 11:05:51AM +0100, Geert Uytterhoeven wrote:
> Add the compatible strings for supporting the generic cpufreq driver on
> the Renesas RZ/G1M (r8a7743) and RZ/G1E (r8a7745) SoCs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Support for RZ/G1M and RZ/G1E is expected to land in v4.10.

Acked-by: Simon Horman <horms+renesas@verge.net.au>
