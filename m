Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8990C001B0
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Aug 2023 09:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbjHKJtk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Aug 2023 05:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234175AbjHKJth (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Aug 2023 05:49:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5095C272D;
        Fri, 11 Aug 2023 02:49:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D9B0066D9E;
        Fri, 11 Aug 2023 09:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52550C433C8;
        Fri, 11 Aug 2023 09:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691747376;
        bh=3Xc9b9hpSyJwEiUKOyQH74evABAG1Ic6UHFzpRwxovU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YMKmAUimk6KBhi5Fn3IPqNHbbLbyVegXcKtPOkA/B5xi7eKjXfY4VzTIKdvjvZ3Mg
         Ul2z9s2muCahBOZUQnDXnxU1fXrwCrNvAc0v1nyt/loclLNZs1SlLxj9asDt530Pan
         srVUSi31gKMcvFwEzStFvqaSFUFnczXcC0cuvs9ZIm1e81S2tgGzOS3PdD+SlDMSF8
         oBkRDfASkuYu5Pr/jW7oJXcksb/rqmUTCA2tcVNg2khYuvuZ0OJDQlpiPr3nUCIRdJ
         dkx8zG67/NWBM8AJPtegc6ujXALIhOdjkKOMsQTZPoPWLzcg89upNJjCrucZfWL3p6
         JdeNBbWcHwxiQ==
Date:   Fri, 11 Aug 2023 11:49:30 +0200
From:   Simon Horman <horms@kernel.org>
To:     alexis.lothore@bootlin.com
Cc:     =?utf-8?Q?Cl=C3=A9ment?= Leger <clement@clement-leger.fr>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH net-next v5 0/3] net: dsa: rzn1-a5psw: add support for
 vlan and .port_bridge_flags
Message-ID: <ZNYEKrQZz/4NY4mW@vergenet.net>
References: <20230810093651.102509-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230810093651.102509-1-alexis.lothore@bootlin.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 10, 2023 at 11:36:48AM +0200, alexis.lothore@bootlin.com wrote:
> From: Alexis Lothoré <alexis.lothore@bootlin.com>
> 
> Hello,
> this series enables vlan support in Renesas RZN1 internal ethernet switch,
> and is a follow up to the work initiated by Clement Leger a few months ago,
> who handed me over the topic.
> This new revision aims to iron the last few points raised by Vladimir to
> ensure that the driver is in line with switch drivers expectations, and is
> based on the lengthy discussion in [1] (thanks Vladimir for the valuable
> explanations)
> 
> [1] https://lore.kernel.org/netdev/20230314163651.242259-1-clement.leger@bootlin.com/
> 

For series,

Reviewed-by: Simon Horman <horms@kernel.org>

