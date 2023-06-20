Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEE2EB64D7
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 20 Jun 2023 10:06:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjFTKGN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 20 Jun 2023 06:06:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231812AbjFTKFt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2023 06:05:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCE91AC;
        Tue, 20 Jun 2023 03:05:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C106661193;
        Tue, 20 Jun 2023 10:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA59C433C9;
        Tue, 20 Jun 2023 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687255531;
        bh=vc5WlVlGI94okyigrFf0d+GSybFc03mLe2FWiiXr8N0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sddhdzg2AhtXOX2BNswSTh047C+vw9hNecLzglmn1TpZi9ZIiK9ocqIu4pRfUM3Xj
         bVwHX9pEykboXk/Oqllb3Mmr9AwMLuFWpbC1QL4ohgeWHuIgXPstMLe6vOp8q4J1mH
         f+4/Dxq9YAqg8GdgHonl8n3IDPWtFo9Dn36eTA3eai/DOvUCg8U1EW4SjgDg0NigCG
         Fkpm/Vsly5A7K+wHG/wMBAefevtdl0a/1xqkOGH8GAa/kXPpLMqrhj4KvCbvYlHIL5
         XZ3IXxDX9Fen5aA5uGl6Y706YeZw/kj9cr6uBj+bmn2mxKH3EEZlLRw0TBfizniERA
         ac7vKTEAnEWnA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1qBYEt-00080a-8T; Tue, 20 Jun 2023 12:05:31 +0200
Date:   Tue, 20 Jun 2023 12:05:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/5] gnss: ubx: add support for the reset gpio
Message-ID: <ZJF56yaeyIGiK9qu@hovoldconsulting.com>
References: <20230523064310.3005-1-wsa+renesas@sang-engineering.com>
 <20230523064310.3005-5-wsa+renesas@sang-engineering.com>
 <ZJFSjrf41PHe400c@hovoldconsulting.com>
 <ZJFsGWepuvkSjL9a@shikoro>
 <ZJFtdWK5I13YUUcu@hovoldconsulting.com>
 <ZJF0U/mIniEksVwZ@ninjato>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q/yN9VCYAD/fgz9L"
Content-Disposition: inline
In-Reply-To: <ZJF0U/mIniEksVwZ@ninjato>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--Q/yN9VCYAD/fgz9L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 11:41:39AM +0200, Wolfram Sang wrote:
>=20
> > But can you elaborate on the "disappearing" bit? How exactly does it
> > "disappear" when the gnss0 device is *not* opened?
>=20
> When you send an I2C message with the address of the device, it usually
> ACKs it to say "Hi, I am here". When the ublox device is in reset state,
> it does not ACK its address. So, tools like "i2cdetect" will not report
> the device as "someone is listening there".

Ah, ok, so you used it to verify that reset is working as intended.

Rereading the commit message now it makes more sense, I guess I was
thrown off by the reference to I2C. Perhaps adding a sentence or two
about the alternate interface and using it as a means of verification
would make things a bit more clear.

Johan

--Q/yN9VCYAD/fgz9L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCZJF55wAKCRALxc3C7H1l
CDIpAP4kmGFSuyp69uWui9laihxxH35pNGIkCvnQs1MAIZYvAgD+MVPI7cZ+4WKi
ctaineUcuYKMsPqBCC8411pUQElQiQE=
=oN5T
-----END PGP SIGNATURE-----

--Q/yN9VCYAD/fgz9L--
