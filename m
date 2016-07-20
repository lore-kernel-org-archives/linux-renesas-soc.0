Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:42586 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750703AbcGTEBQ (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 20 Jul 2016 00:01:16 -0400
Date: Tue, 19 Jul 2016 21:01:14 -0700 (PDT)
Message-Id: <20160719.210114.348102018460162904.davem@davemloft.net>
To: yoshihiro.shimoda.uh@renesas.com
Cc: daniel@iogearbox.net, willemb@google.com, ast@plumgrid.com,
	tklauser@distanz.ch, fruggeri@aristanetworks.com,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] packet: fix second argument of sock_tx_timestamp()
From: David Miller <davem@davemloft.net>
In-Reply-To: <1468906851-8424-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1468906851-8424-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Tue, 19 Jul 2016 14:40:51 +0900

> This patch fixes an issue that a syscall (e.g. sendto syscall) cannot
> work correctly. Since the sendto syscall doesn't have msg_control buffer,
> the sock_tx_timestamp() in packet_snd() cannot work correctly because
> the socks.tsflags is set to 0.
> So, this patch sets the socks.tsflags to sk->sk_tsflags as default.
> 
> Fixes: c14ac9451c34 ("sock: enable timestamping using control messages")
> Cc: <stable@vger.kernel.org>
> Reported-by: Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>
> Reported-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Applied.
