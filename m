Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47889C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E27120874
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 12:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="NKkIWdUB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731344AbfAKMt7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 07:49:59 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33156 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730421AbfAKMt7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 07:49:59 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CD84F25B76D;
        Fri, 11 Jan 2019 23:49:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547210997; bh=C1JQ6nSQTCPMeO1udUNoiuCzOUbujzR36xYVVg0eoFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NKkIWdUBoFl72JwgHjIqJcOdBKforXKmQBonbhokksJWx7foKh0fRWlAd4HgFXJLi
         iAmKNNvzKZg4Flrz/UYjL5GU9PsW38+D2HuREdv0ATbfmOMxBYDe0q9G1OtX7Hglmv
         LFxoTLFsql1+Kq9rEBXQ2qza7f0IKArpV6mqmhfk=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 3DE1DE218F1; Fri, 11 Jan 2019 04:49:55 -0800 (PST)
Date:   Fri, 11 Jan 2019 13:49:55 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "pinctrl: sh-pfc: r8a77990: Add support for
 pull-up only pins"
Message-ID: <20190111124954.cbx2nimxky2bsold@verge.net.au>
References: <20190111115744.29685-1-geert+renesas@glider.be>
 <20190111115744.29685-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111115744.29685-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 12:57:44PM +0100, Geert Uytterhoeven wrote:
> This reverts commit f4caa6ee736fa8a46c806ba4382c16f7e5a20248.
> 
> The same can be expressed better by dropping the
> SH_PFC_PIN_CFG_PULL_DOWN flag from the GPIO description, as it includes
> returning an error to the caller when trying to configure the pin for
> pull-down, causing:
> 
>     sh-pfc e6060000.pin-controller: pin_config_set op failed for pin 201
>     sh-pfc e6060000.pin-controller: Error applying setting, reverse things back
>     sh-pfc e6060000.pin-controller: failed to select default state
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

