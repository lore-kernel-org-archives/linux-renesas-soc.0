Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:36005 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932521AbcHIXQh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 9 Aug 2016 19:16:37 -0400
Date: Tue, 09 Aug 2016 16:16:36 -0700 (PDT)
Message-Id: <20160809.161636.2181233072433514866.davem@davemloft.net>
To: niklas.soderlund+renesas@ragnatech.se
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	sergei.shtylyov@cogentembedded.com, wsa@the-dreams.de
Subject: Re: [PATCH 2/2] ravb: add sleep PM suspend/resume support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20160803135647.23242-3-niklas.soderlund+renesas@ragnatech.se>
References: <20160803135647.23242-1-niklas.soderlund+renesas@ragnatech.se>
	<20160803135647.23242-3-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
Date: Wed,  3 Aug 2016 15:56:47 +0200

> The interface would not function after the system had been woken up
> after have been suspended (echo mem > /sys/power/state) cycle. The
> reason for this is that all device registers have been reset to its
> default values. This patch adds sleep suspend and resume functions that
> detached the interface at suspend and restore the registers and reattach
> the interface at resume.
> 
> Only the registers that are only configured at probe time needs to be
> explicitly restored by the resume handler. All other registers are
> reconfigured by either reopening the device in the resume handler (if
> the device was running when the system was suspended) or when the
> interface is opened by a user at a later time.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Applied to net-next, thanks.
