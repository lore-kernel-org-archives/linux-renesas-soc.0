Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:51741 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752409AbcFBGdx (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 2 Jun 2016 02:33:53 -0400
Date: Wed, 01 Jun 2016 23:33:47 -0700 (PDT)
Message-Id: <20160601.233347.1221263727235695028.davem@davemloft.net>
To: ykaneko0929@gmail.com
Cc: netdev@vger.kernel.org, sergei.shtylyov@cogentembedded.com,
	horms@verge.net.au, magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] ravb: Remove manual pause frame transmit
From: David Miller <davem@davemloft.net>
In-Reply-To: <1464799265-27431-1-git-send-email-ykaneko0929@gmail.com>
References: <1464799265-27431-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Thu,  2 Jun 2016 01:41:05 +0900

> From: Masaru Nagai <masaru.nagai.vx@renesas.com>
> 
> Writing a non-zero value to the manual PAUSE frame register (MPR) starts
> the transmission of a PAUSE frame.
> A PAUSE frame is sent in ravb_emac_init(), but it is not expected behavior.
> 
> Signed-off-by: Masaru Nagai <masaru.nagai.vx@renesas.com>
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Applied, thanks.
