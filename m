Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A883C54EE9
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 20 Sep 2022 06:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiITGV6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 20 Sep 2022 02:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiITGV5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Sep 2022 02:21:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848FC15A27;
        Mon, 19 Sep 2022 23:21:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3EE70B824E9;
        Tue, 20 Sep 2022 06:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C5CC433D7;
        Tue, 20 Sep 2022 06:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663654914;
        bh=3sJWRl+J/q3DcjQpY50g5O+wsnvw0WrYojCy/QlMC/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=q5Oa3UtXvwQ3ccq0WHQhH+aEBQeb89xFVX3L1vIFCRJPH5Pt0bhh68cCPQCE8Hyiw
         6SJmn/w4UYyS40I6oT9Ww+0pfZF9nhYlRRx5O6K2sfMMKy4pu7ImlUVG2wB6bm9M0Y
         iPCrxg0F072UaZf6S81Rl1BFCvG67Jg3Z6n69QDD6I/s+yK1fbxyI/ne1beNJPSYtL
         2bHUPxCkubzZAZlp0p3SsnEDHvxOYjio5Hf39VNNso1L32e3Zz1d0WG5ODVnPwjPKg
         XcuEwACe9ILriH8Th0K1SXJ09LUF6uOwr02m2ZYa2av/VTY2cDJich1w32F6ynpv0p
         EbO/A5k6EUD3g==
Date:   Tue, 20 Sep 2022 11:51:50 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: phy: renesas,rcar-gen2-usb-phy: Convert
 to json-schema
Message-ID: <Yylb/phqpn6TguUB@matsya>
References: <dbdcffd009302734fe2fb895ce04b72fa1ea4355.1663165000.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbdcffd009302734fe2fb895ce04b72fa1ea4355.1663165000.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 14-09-22, 16:17, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Gen2 USB PHY Device Tree binding documentation
> to json-schema.

Applied, thanks

-- 
~Vinod
