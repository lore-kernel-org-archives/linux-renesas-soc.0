Return-Path: <SRS0=drmD=QA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1382DC282C3
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 19:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD3B920663
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 24 Jan 2019 19:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548359173;
	bh=PKvV/N4Biwko2Tz2hIYrjFcs0LHlvSmPVYS9bvtY9fI=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=xifwjqVTe2+/Z/0PY0X7rDpLWiti2UyBMG/bOIzq1YwSbKC8EiJ4BC82TnBG5N97Z
	 gApR06qk8T/jSN2VGm+iAxyfX05dPdmGNo3jPrLD1kNZQu/cbYmGcY/ahGT62Ate5E
	 4wS5kGoSVYwi2gBMKRFM3DzG14efdS9xOjOHVK9A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731906AbfAXTqN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 24 Jan 2019 14:46:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:44992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733294AbfAXToN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jan 2019 14:44:13 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1375D218E2;
        Thu, 24 Jan 2019 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548359053;
        bh=PKvV/N4Biwko2Tz2hIYrjFcs0LHlvSmPVYS9bvtY9fI=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=A3u4wN6DOijip7rhRYuwVtTiQH2igFLuZ6OD+UC13Jwp2yBqq6ESDfKMPBwO+cTdx
         ckQAqcuiaTzqOKsjDj5mw7aCNBmWD9kAV6dQqv11QRpXnpZiuzVmGXJShxeiNDsw3a
         feLQfYqyJZzCMUa5jzGvaCuKxbklidcYQfuqJtfk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [git pull] clk: renesas: Updates for v5.1
References: <20190124152607.30916-1-geert+renesas@glider.be>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190124152607.30916-1-geert+renesas@glider.be>
Message-ID: <154835905238.136743.13357821231243537859@swboyd.mtv.corp.google.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Date:   Thu, 24 Jan 2019 11:44:12 -0800
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-01-24 07:26:07)
>         Hi Mike, Stephen,
>=20
> The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee50=
0c:
>=20
>   Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git=
 tags/clk-renesas-for-v5.1-tag1
>=20
> for you to fetch changes up to d9286d9743b6e8cfbf1a13f8db84e9c65c0b09c7:
>=20
>   clk: renesas: r8a774c0: Correct parent clock of DU (2019-01-24 16:01:08=
 +0100)
>=20
> ----------------------------------------------------------------
> clk: renesas: Updates for v5.1
>=20
>   - Add missing CANFD clocks on RZ/G2M and RZ/G2E,
>   - Correct the DU (display unit) parent clock on RZ/G2E.
>=20

Thanks. Pulled into clk-next.
