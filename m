Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 033F7C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 13:13:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CF3F02084C
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 13:13:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfDCNNM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 09:13:12 -0400
Received: from sauhun.de ([88.99.104.3]:48728 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfDCNNM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 09:13:12 -0400
Received: from localhost (p54B3311F.dip0.t-ipconnect.de [84.179.49.31])
        by pokefinder.org (Postfix) with ESMTPSA id 5DAEB2C282F;
        Wed,  3 Apr 2019 15:13:10 +0200 (CEST)
Date:   Wed, 3 Apr 2019 15:13:09 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: core: retry CMD1 in mmc_send_op_cond() even if the
 ocr = 0
Message-ID: <20190403131309.mlj5twiymmjw24rr@ninjato>
References: <1553764807-5778-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="khxhdzcp36osyund"
Content-Disposition: inline
In-Reply-To: <1553764807-5778-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--khxhdzcp36osyund
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shimoda-san,

thank you for this bugfix! Looks like a nice catch.

> +
> +		/*
> +		 * According to eMMC specification, we should issue CMD1

Maybe it is good to specify where? I found it in the standard v5.1,
section 6.4.3.

> +		 * repeatidly in the idle state until the eMMC is ready even if

"repeatedly"

> +		 * the mmc_attach_mmc() calls this function with ocr = 0.

I would suggest to remove the "if ..." part from the comment. Because
you remove the 'if (ocr == 0)' code, so it becomes less obvious what
that part of the comment relates to.

> +		 * Otherwise some eMMC devices seem to enter the inactive mode
> +		 * after mmc_init_card() issued CMD0 when the eMMC device is
> +		 * busy.
> +		 */

Other than that, good documentation!

> +		if (!ocr && !mmc_host_is_spi(host))
> +			cmd.arg = cmd.resp[0] | BIT(30);

I think BIT(30) is okay for this bugfix. But as a follow up, we should
turn this into a define. It could be used in mmc_init_card() as well and
will make the code way more readable.

All the best,

   Wolfram


--khxhdzcp36osyund
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyksWEACgkQFA3kzBSg
KbYe8RAAsCgTMDo1DewOr7o3rVvBVJaXB6RKPYCMcqon3GpKVNcI215Uc9IPTyPz
MHZGBXeKRVwVc2Ooz76MyfPVIzcEatUM9q4OJwHc4Kgj13W00MYQkxiydCutr1Nw
J9oxVJrtBE1H+0qL1Hw/A6gYpufmReqw8tdzE3UbQaw9fV+lh0zbOO5q8XVaykwB
rMkvSyqsRKnxNjyjMbkiP/qAftje9KrJwi4yqSEO0mdE5STICekSgoiVCQhS1mdX
jYneUOlDOruHZw/Bmy0v/WwsGxSzFSib2C+QCMCcwOAfeFw+1Pv1SnFJ4c3DMbfW
uxy9T/BksYhZzqR+9dIUWcAH/g6RrFzrXh/95NYI8A+FqyUaDPM3wTiJFr7NFOa4
UHgBMRQp/tMH+FAfLs6hk7xyWzzLRNZ3RTciQHnS/0u77T4iwR4gzW8ksgoIOlUW
T11xLiY7hePbCeZe72bzm2aR3tDOc0oAHxGwsBZceNo6MF2qqQyJewLx7+fmhzJZ
7auoqPaHbPTib6LwAYZlvU6exftwpFZT8sPMND+9aQCNOs5353T2jiRL6dgXkyaB
XpIvWW33sr2iS8VoPKZM7m5pV4+wQoCIMnjcPs5B1ldc2BI1I4rk4uRtCQu1bGXN
TERat1WhLIp6Kc+qwChc63K2N/NPziL8YcOW0RN3y8d3tH3qsmc=
=IONW
-----END PGP SIGNATURE-----

--khxhdzcp36osyund--
