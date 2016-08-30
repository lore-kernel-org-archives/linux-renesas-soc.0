Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34347 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752641AbcH3GwV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 02:52:21 -0400
Date: Tue, 30 Aug 2016 08:52:14 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: shmobile: remove label property from led
Message-ID: <20160830065213.GA12845@verge.net.au>
References: <1472219382-22789-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdW7=XB_-7YvMwBw-7WLaEj8A4=znsvRkTbdf5SCYe00rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW7=XB_-7YvMwBw-7WLaEj8A4=znsvRkTbdf5SCYe00rg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 29, 2016 at 09:53:23AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> The patch index in the subject should have been 0/4. You're breaking my
> script to extract patch series from email threads ;-)

True. Probably we should not apply this series as its just a clean up
and not worth the risk of breaking user-space.
