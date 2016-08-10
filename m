Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:41466 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751148AbcHJVwS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 10 Aug 2016 17:52:18 -0400
Date: Wed, 10 Aug 2016 14:52:17 -0700 (PDT)
Message-Id: <20160810.145217.313553520154842617.davem@davemloft.net>
To: niklas.soderlund+renesas@ragnatech.se
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	sergei.shtylyov@cogentembedded.com, wsa@the-dreams.de
Subject: Re: [PATCH] ravb: use proper names for suspend/resume functions
From: David Miller <davem@davemloft.net>
In-Reply-To: <20160810110949.16608-1-niklas.soderlund+renesas@ragnatech.se>
References: <20160810110949.16608-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
Date: Wed, 10 Aug 2016 13:09:49 +0200

> The patch 'ravb: add sleep PM suspend/resume support' used incorrect
> function names containing 'runtime' for the suspend and resume
> functions.
> 
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Applied, thanks.
