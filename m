Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36818 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756434AbdDRJ02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2017 05:26:28 -0400
Received: by mail-lf0-f42.google.com with SMTP id c80so27199834lfh.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2017 02:26:27 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: m3ulcb: Fix EthernetAVB PHY timing
To: Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
References: <1492477578-10228-1-git-send-email-horms+renesas@verge.net.au>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Vladimir Barinov <vladimir.barinov+renesas@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a7afb651-d103-248c-5610-2fc41a773c52@cogentembedded.com>
Date: Tue, 18 Apr 2017 12:26:25 +0300
MIME-Version: 1.0
In-Reply-To: <1492477578-10228-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 4/18/2017 4:06 AM, Simon Horman wrote:

> Set PHY rxc-skew-ps to 1500 and all other values to their default values.
>
> This is intended to to address failures in the case of 1Gbps communication
> using the by salvator-x board with the KSZ9031RNX phy. This has been

    The by? :-)

> reported to occur with both the r8a7795 (H3) and r8a7796 (M3-W) SoCs.
>
> Based in a similar patch for the r8a7796 salvator-x by Kazuya Mizuguchi.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

MBR, Sergei
