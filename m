Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D241B394F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 14:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770733201; cv=none; b=kF+w5EfCu6C9OX2A98+B8dd0o+BaZrPAkVt3l8pSaMi0+M3HqoqTq6VFxA+2dSeMxktYuaFfOpQJ+/QXKZxCNLC75nfW4yoaA7WrmvLV1HRVdlCCYYB2vkjuVr5EYsbg8Xpl5erKg9EdEqqxWFLOcmmrOwJBHof7eA9aqe2rtX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770733201; c=relaxed/simple;
	bh=Odw3h2xXVkrcgCjrEBxTd6gG5L40NhU7zxaajIxkAsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jqyw87x5yJjLlNar6x1SN3fGrxQSKZZEOdHFzshDmPRmukKarR+ZfTvcZNTgQiesGCTW3B5r7FGuwzX/aCvBbuFbOb9mamiO4Lj4nFYZuUpsffbBiySQaOw3Kabf5mNw1EpA/LPgAS76YWA1eAvWXShG+Ahj4WwQB4b7M0SroVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bh+T3j3i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bh+T3j3i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD0DC16AAE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 14:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770733201;
	bh=Odw3h2xXVkrcgCjrEBxTd6gG5L40NhU7zxaajIxkAsA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bh+T3j3iTWYfAVEB+OpSnFuBl7FTl9X1t7PcutsI3Q/B/GDgJjifvoWAJ2+gzXief
	 vJM69hMd4FvOnqcEd/FihbVtkdycwE4EHu48Jdhmje8UVA9ZZR4ed2dKs/zBt0Aad3
	 EUfyt0KYattmvr31qg31g04Nw+Dj2/tuYCsYtUsyoV3hOTjOglRokyfrNdFqIIEArr
	 STv26k3KsuZ9uE2e2ike9TJflX4NT3S2CcOLWAvjMKrkuicUIFFfAS+n65KdL4I/aw
	 PDcczD7NL3yo8+pSQ+ChJ37Emt7J+jZMysH34NuQzCmXoIxhUVlIWBndFw4hhh9SKC
	 UhN0jo0iwG0sw==
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64ae1729637so2257772d50.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 06:20:01 -0800 (PST)
X-Gm-Message-State: AOJu0YxB1nYVVlOvdZjRv0WXUNgGVLCmEyZU3ZD1rmCJvRadNhJqsTRO
	FRLpSJJ9/XPQVQVrnx74uofbOBfWAIMC7IKDn8++TdR044DnoTo5BMaQP2OzqEdLkPKz0tW/LGo
	vdZip9zCemqDqqgHKxTtIliZxdO5/eXw=
X-Received: by 2002:a05:690e:150b:b0:649:3e3d:327 with SMTP id
 956f58d0204a3-649f1eb3d66mr13590998d50.40.1770733200730; Tue, 10 Feb 2026
 06:20:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260210110057.10869-1-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Feb 2026 15:19:49 +0100
X-Gmail-Original-Message-ID: <CAD++jLntW0QZ+Nt45Z-G2wbmqrL5jtnuy2B5_rRE6eS2w-1Nqg@mail.gmail.com>
X-Gm-Features: AZwV_QjNXHFtXvNMF9TF_TvJtup1g1L8Eh_OBP9sLN0HF7Jz7nHdNO-AVIyYB00
Message-ID: <CAD++jLntW0QZ+Nt45Z-G2wbmqrL5jtnuy2B5_rRE6eS2w-1Nqg@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 12:01=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

[Page Mathieu who I think wrote this driver]

> As stated in patch 1, the U8500 driver is clearly unused for more than a
> decade. Removing it allows us to remove generic platform_data support.
> Both removals make the upcoming refactoring (headers and lock
> allocation) in the hwspinlock subsystem easier.

Fair enough, these hwsemaphores were only used when communicating
with two DSPs that we never managed to support upstream.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
