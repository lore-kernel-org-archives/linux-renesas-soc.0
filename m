Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33406 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751030AbdJKHg5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Oct 2017 03:36:57 -0400
Date: Wed, 11 Oct 2017 09:36:48 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC] mmc: tmio: fix tuning for stubborn cards
Message-ID: <20171011073648.GF9661@verge.net.au>
References: <20171011000814.21055-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171011000814.21055-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 11, 2017 at 02:08:14AM +0200, Niklas Söderlund wrote:
> The commit 43b0b361b0170030 ("mmc: tmio: always get number of taps")
> changed the behavior of the tuning. Before the commit the SCC was only
> enabled for the first tuning attempt (host->init_tuning(host)), if that
> failed the hardware where reset and tuning retried. In the second
> attempt the SCC where never configured and tuning would succeed for some
> stubborn cards. This patch restore this behavior which allows a troubled
> card I have to be used.

Hi Wolfram,

Is tuning retried if the card is changed, f.e. ejected and a different card
inserted?
