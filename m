Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37481 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932837AbeCEGqE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Mar 2018 01:46:04 -0500
Date: Mon, 5 Mar 2018 07:46:00 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ARM: shmobile: defconfig: Disable CONFIG_EMBEDDED
Message-ID: <20180305064559.lvopsycvame73bs2@verge.net.au>
References: <1519993666-11041-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519993666-11041-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Mar 02, 2018 at 01:27:44PM +0100, Geert Uytterhoeven wrote:
> 	Hi Simon, Magnus,
> 
> This patch series disables CONFIG_EMBEDDED in shmobile_defconfig, which
> stands in the way of using more sane defaults expressed in Kconfig
> logic.
> 
> The first patch does a mandatory refresh of shmobile_defconfig as a
> preparatory step/
> The second patch actually disables CONFIG_EMBEDDED.

Thanks, applied.
