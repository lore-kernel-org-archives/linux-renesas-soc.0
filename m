Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5BCC4338F
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Aug 2021 12:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E26E8611B0
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  6 Aug 2021 12:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343749AbhHFMm7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 6 Aug 2021 08:42:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:55888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236860AbhHFMm7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 08:42:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABE2561167;
        Fri,  6 Aug 2021 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628253763;
        bh=zV7uIcw/dyH/pj9VePohMNNlJVX4LwUb4WWxHvJwSE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ahB2wIZTXS6UCS4IWtnh16WeBfc9HOKRjUlzFIe+QgD9uws7/QqTbmFPH19a0vrOi
         2NNcjEvtj5yCRl2d3MDueK1BFb18vKki3N41z4Ts3QaqE9AHV1DW+Rvb7y8RG38ZR6
         zqpItgYTeDr/NA7d5c7TaphHGVj+ZDAGtDDOqMWM1aT/Kz2eQU9EF065pge89wuV5p
         7bqGpD23/AECcYXMx0G7psqn4OKHlQWaeOkfqsWL/EshAHQ3Bs37KWS4q0gmDK2Ax4
         NtaTDZKoWKz57FRiUrdeiBvNJBpe8Hr452QXfs3Gpxrf5DtsYr3wnlCf67FpZr6UI2
         UO+SvnXNIMg2w==
Date:   Fri, 6 Aug 2021 18:12:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 2/6] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Message-ID: <YQ0uP0yjYe+jOe6W@matsya>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
 <20210727185527.19907-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727185527.19907-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27-07-21, 19:55, Biju Das wrote:
> Document USB phy bindings for RZ/G2L SoC.
> 
> RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes. It uses
> a different OTG-BC interrupt bit for device recognition. Apart from this,
> the PHY reset is controlled by USBPHY control IP and Document reset is a
> required property.

Applied, thanks

-- 
~Vinod
