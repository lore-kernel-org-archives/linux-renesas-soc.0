Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:36653 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbdARROT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2017 12:14:19 -0500
Received: by mail-lf0-f48.google.com with SMTP id z134so17390723lff.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2017 09:14:18 -0800 (PST)
Subject: Re: [PATCH] ARM: shmobile: r8a7779: marzen: Fix sata device status
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
References: <1484585813-22534-1-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <8b298878-672b-74fe-5196-99f8620889ac@cogentembedded.com>
Date: Wed, 18 Jan 2017 20:06:02 +0300
MIME-Version: 1.0
In-Reply-To: <1484585813-22534-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/16/2017 07:56 PM, Geert Uytterhoeven wrote:

> Device nodes representing I/O devices should be marked disabled in the
> SoC-specific DTS, and overridden by board-specific DTSes where needed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

    Simon, I'm seeing this commit in the 'devel' branch but not seeing the new 
tag containing it... forgot to tag/push?

MBR, Sergei
