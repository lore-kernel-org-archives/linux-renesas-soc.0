Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:56548 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966876AbdAIUzo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 15:55:44 -0500
Date: Mon, 09 Jan 2017 15:55:42 -0500 (EST)
Message-Id: <20170109.155542.1563572267512721426.davem@redhat.com>
To: niklas.soderlund+renesas@ragnatech.se
Cc: sergei.shtylyov@cogentembedded.com, horms+renesas@verge.net.au,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        geert@linux-m68k.org, linux-pm@vger.kernel.org
Subject: Re: [PATCHv3 0/6] sh_eth: add wake-on-lan support via magic packet
From: David Miller <davem@redhat.com>
In-Reply-To: <20170109153409.13956-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170109153409.13956-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
Date: Mon,  9 Jan 2017 16:34:03 +0100

> This series adds support for Wake-on-Lan using Magic Packet for a few
> models of the sh_eth driver. Patch 1/6 fix a naming error, patch 2/6 
> adds generic support to control and support WoL while patches 3/6 - 6/6 
> enable different models.
> 
> Based ontop of net-next master.
 ...

Series applied, thanks.
