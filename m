Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:46204 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759337AbdKPUc3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Nov 2017 15:32:29 -0500
Received: by mail-lf0-f52.google.com with SMTP id g35so289897lfi.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Nov 2017 12:32:29 -0800 (PST)
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
To: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
References: <20171116201842.006310882@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d3ac29e8-8138-17fc-4863-2ae4f702130f@cogentembedded.com>
Date: Thu, 16 Nov 2017 23:32:25 +0300
MIME-Version: 1.0
In-Reply-To: <20171116201842.006310882@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/16/2017 11:18 PM, Sergei Shtylyov wrote:

> Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
> Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:

    Later, of course. Could be fixed while committing, I guess?

> add onsemi,pca9654 id") made use of another, undocumented vendor prefix.
> Since such prefix doesn't seem to be used in any device trees, I think we
> can just fix the "compatible" string in the driver and the bindings and be
> done with that...
> 
> Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
