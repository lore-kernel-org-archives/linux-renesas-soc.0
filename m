Return-Path: <SRS0=D9XG=XS=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED45BC04EBF
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 23 Sep 2019 11:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CA23120820
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 23 Sep 2019 11:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbfIWLgG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 23 Sep 2019 07:36:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58932 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392624AbfIWLgG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:36:06 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 98BD925B706;
        Mon, 23 Sep 2019 21:36:04 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9D259940310; Mon, 23 Sep 2019 13:36:02 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:36:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: renesas: tpu: convert bindings to
 json-schema
Message-ID: <20190923113601.5y5zfdqq3kpqovud@verge.net.au>
References: <1569008189-10611-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569008189-10611-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Sep 21, 2019 at 04:36:29AM +0900, Yoshihiro Kaneko wrote:
> Convert Renesas R-Car Timer Pulse Unit PWM Controller bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

