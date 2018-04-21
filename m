Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:40237 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753339AbeDUUdw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Apr 2018 16:33:52 -0400
Received: by mail-lf0-f52.google.com with SMTP id i18-v6so9591579lfc.7
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Apr 2018 13:33:52 -0700 (PDT)
Subject: Re: [PATCH/RFC net-next 2/5] ravb: correct ptp does failure after
 suspend and resume
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
References: <20180417085030.32650-1-horms+renesas@verge.net.au>
 <20180417085030.32650-3-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <51e8277c-5ac3-adc9-9daa-855bf4243468@cogentembedded.com>
Date: Sat, 21 Apr 2018 23:33:48 +0300
MIME-Version: 1.0
In-Reply-To: <20180417085030.32650-3-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

   s/failure/fail/ in the subject.

On 04/17/2018 11:50 AM, Simon Horman wrote:

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> This patch fixes the problem that ptp4l command does not work after
> suspend and resume.
> Add the initial setting in ravb_suspend() and ravb_resume(),
> because ptp does not work.
> 
> Fixes: a0d2f20650e8 ("Renesas Ethernet AVB PTP clock driver")
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

   Other than the earlier comments, this seems good:

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
