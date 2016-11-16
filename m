Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f53.google.com ([74.125.83.53]:33865 "EHLO
        mail-pg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752195AbcKPKJK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Nov 2016 05:09:10 -0500
Received: by mail-pg0-f53.google.com with SMTP id x23so74962564pgx.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Nov 2016 02:09:10 -0800 (PST)
Date: Wed, 16 Nov 2016 15:39:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: dt: Add support for r8a7743 and r8a7745
Message-ID: <20161116100906.GA20987@vireshk-i7>
References: <1479290751-9705-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1479290751-9705-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 16-11-16, 11:05, Geert Uytterhoeven wrote:
> Add the compatible strings for supporting the generic cpufreq driver on
> the Renesas RZ/G1M (r8a7743) and RZ/G1E (r8a7745) SoCs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Support for RZ/G1M and RZ/G1E is expected to land in v4.10.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
