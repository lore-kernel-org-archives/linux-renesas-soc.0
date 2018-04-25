Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:55348 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756073AbeDYSRM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Apr 2018 14:17:12 -0400
Received: by mail-wm0-f68.google.com with SMTP id a8so8735081wmg.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Apr 2018 11:17:11 -0700 (PDT)
Subject: Re: [PATCH/RFC v2] ARM: shmobile: defconfig: Enable LPAE
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <1524672875-14130-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <90afbd8b-462d-8484-74e8-b983a9803fc4@gmail.com>
Date: Wed, 25 Apr 2018 11:17:00 -0700
MIME-Version: 1.0
In-Reply-To: <1524672875-14130-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/25/2018 09:14 AM, Fabrizio Castro wrote:
> On iWave's iwg20m DDR1 512MB memory cannot be accessed with 32-bit
> addresses, hence we need LPAE.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
> This information is mentioned in the "RZ/G Series User’s Manual: Hardware",
> Chapter 2, Area Map. Is this patch going to break the functionality of other
> boards? Comments welcome.

LPAE is not supported by all Cortex-A class cores, for instance
Cortex-A9 does not support LPAE, if you have boards using such cores,
then this would result in a kernel that would not boot on these
platforms. Can that be a problem with the shmobile_defconfig?
-- 
Florian
