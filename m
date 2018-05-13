Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:37466 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751159AbeEMJMa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 13 May 2018 05:12:30 -0400
Received: by mail-lf0-f67.google.com with SMTP id r2-v6so13712893lff.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 13 May 2018 02:12:29 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Add GPIO device nodes
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
References: <20180513090855.25982-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e9646f33-9a82-f3ea-c4a6-cd2469b7658a@cogentembedded.com>
Date: Sun, 13 May 2018 12:12:27 +0300
MIME-Version: 1.0
In-Reply-To: <20180513090855.25982-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 5/13/2018 12:08 PM, Simon Horman wrote:

> The compat string renesas,gpio-rcar has been deprecated since v4.14,
> the same release that r8a77990 SoC support was added. Thus
> renesas,gpio-rcar can safely be removed without any risk of behaviour
> changes between old and new mainline kernels and DTBs.

    This hardly matches the subject. :-)

> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
