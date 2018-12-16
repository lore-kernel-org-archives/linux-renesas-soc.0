Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CDDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 337A32084A
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:32:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="XTxlZsqX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730874AbeLPUc2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 15:32:28 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59074 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730772AbeLPUc2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 15:32:28 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EA76625B764;
        Mon, 17 Dec 2018 07:32:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544992346; bh=Aqj8pey/sMy9P1Cw28Yv6m7rbWetqU7PPIng469+SQM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XTxlZsqXsd6IpDDLZqzhqTZ/iZgpusYTzA+g821HP3n6qYxDjZuCgpIu7yCoh/uiM
         vdSPdOAqpJcWlE9AKRdkRR504kqODlzecNaOKa2bGBFpYcMv0NlcIyp7EEGFX6Z34t
         6eUvOazCVVB1xbjQmESUuoHnPAp1rkHBYgNcsRq4=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E8419E211F6; Sun, 16 Dec 2018 12:32:23 -0800 (PST)
Date:   Sun, 16 Dec 2018 21:32:23 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 03/17] arm64: dts: renesas: r8a774c0: Add IPMMU device
 nodes
Message-ID: <20181216203223.bvf7lw6e4n5iwnik@verge.net.au>
References: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1544780260-27590-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544780260-27590-4-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 14, 2018 at 09:37:26AM +0000, Fabrizio Castro wrote:
> Add r8a774c0 IPMMU nodes.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

