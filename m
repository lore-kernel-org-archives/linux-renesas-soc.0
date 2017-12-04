Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44695 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754390AbdLDPFh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 10:05:37 -0500
Date: Mon, 4 Dec 2017 16:05:34 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mmc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <simon.horman@netronome.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 14/22] mmc: tmio,renesas_sdhi: move ssc_tappos to
 renesas_sdhi.h
Message-ID: <20171204150533.kj73bhb52xph6x66@ninjato>
References: <1511540697-27387-1-git-send-email-yamada.masahiro@socionext.com>
 <1511540697-27387-15-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511540697-27387-15-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 25, 2017 at 01:24:49AM +0900, Masahiro Yamada wrote:
> struct tmio_mmc_host has "scc_tappos", but in fact, it is Renesas
> private data.  Move it to renesas_sdhi.h
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
