Return-Path: <SRS0=xQI0=RO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A506C10F06
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 18:46:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5FB682084F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 11 Mar 2019 18:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfCKSql (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 11 Mar 2019 14:46:41 -0400
Received: from sauhun.de ([88.99.104.3]:59786 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726675AbfCKSql (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Mar 2019 14:46:41 -0400
Received: from localhost (p54B3359D.dip0.t-ipconnect.de [84.179.53.157])
        by pokefinder.org (Postfix) with ESMTPSA id E2E8D2C08C3;
        Mon, 11 Mar 2019 19:46:38 +0100 (CET)
Date:   Mon, 11 Mar 2019 19:46:31 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] i2c: add extra check to safe DMA buffer helper
Message-ID: <20190311184630.5yqy3wf2xkhukwp5@ninjato>
References: <20190309105441.18472-1-wsa+renesas@sang-engineering.com>
 <CAJMQK-iDbBhD95Dweq2q8cMpJ65RCKUTzm8CLTYms6BxpqADXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="v6mike5tnoldg4qv"
Content-Disposition: inline
In-Reply-To: <CAJMQK-iDbBhD95Dweq2q8cMpJ65RCKUTzm8CLTYms6BxpqADXQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--v6mike5tnoldg4qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> How about also printing some warning if threshold is zero? Since

Hmm, not a warning because a user of a kernel can't do much about it. A
debug might make sense; it is for developers and will be compiled away
for production use.

> caller might expect that if msg->len >= threshold, they will get valid
> pointer. But they will get valid pointer if (msg->len, threshold) is
> (>0, 0) and NULL if (=0, 0). So warn them that the threshold is bogus.

Well, callers should always check for NULL because a valid pointer can
not be guaranteed (ENOMEM case). And I still don't get why would you
want a valid DMA-able pointer if the msg length is 0?

Thanks!


--v6mike5tnoldg4qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyGrQIACgkQFA3kzBSg
Kbb61Q//XZoT6dJYvO2WdyhYQf2Zpb4S1JEwSkMxa1XRQmw4caIdOLyJVt+OPzFo
6Swbg0GQbFPV0tagj9VRTTWWTA6biRf69t+d5fNCMFWJ4Rx89CuJvy1EOA6A8LHN
Ckce/8HUXJAFdIaMwlkCagwepfO3WJ7GYDrGxiOM9e8cCOGkNgw/bXe3Xks2rcgC
8eFiUGqDrrG3LwsTlqBfjBC1aErwYgC/QBO0uhWiodkszggEV8T1D9ykbfTSOvCr
LHZro3jzmR8E+K1zsujXuP2eDAhaN5V1s7VNI2mrzsQcxl/v7YKd17Us5Iqzq/1d
4Ynv0gr7kTLoq5wOv5gamESXQ+m8PBmU7gikrIBh7ie0HXXyQY1U7sO5iSwBoMwC
eMegBAK8IDr5qM2YAb+urQQ/w7NdA731cYpm0+srfVSsxdpCvWJSROXHjRcrBzkm
xkw9fY0s5l5hWzWtjrOocYVd68MOmj6hnVFW6n9itAuRsi7CZJ4UnxxpcCbBgfEQ
+fhru8D6Ie1VkUtLtQlNFh61KJDTZ1Sg2YisL1M1N/nRAH22pSaMxyX2kpXsZI7f
WsCVIj3Rgow6vOqqUa85aYOqcyWllO29AMTMu+srAbfUWTIZ6iTtB5Dz5bC9oUPN
YyfviJYySO6UocuuZH1AAmvPdoqlly11ouTiA69vlPIx0hW8o9U=
=ZJU8
-----END PGP SIGNATURE-----

--v6mike5tnoldg4qv--
