Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:49035 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125AbcFAXBM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 1 Jun 2016 19:01:12 -0400
Date: Wed, 01 Jun 2016 16:01:08 -0700 (PDT)
Message-Id: <20160601.160108.856248993077839870.davem@davemloft.net>
To: ykaneko0929@gmail.com
Cc: netdev@vger.kernel.org, sergei.shtylyov@cogentembedded.com,
	horms@verge.net.au, magnus.damm@gmail.com,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next] ravb: Add SET_RUNTIME_PM_OPS macro
From: David Miller <davem@davemloft.net>
In-Reply-To: <1464553543-19091-1-git-send-email-ykaneko0929@gmail.com>
References: <1464553543-19091-1-git-send-email-ykaneko0929@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Date: Mon, 30 May 2016 05:25:43 +0900

> From: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> 
> Use SET_RUNTIME_PM_OPS macro instead of assigning a member of
> dev_pm_ops directly.
> 
> Signed-off-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Applied.
