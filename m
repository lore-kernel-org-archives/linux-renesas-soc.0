Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0D03C8719
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 13:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465531; cv=none; b=JqmuKY/tzSJm+efbq8t42lvvG9UyErKVVPWoLeMouwqaLUcIcpGxTxhJUfXkUK4+FrXjZifZ/sapB4oIHGelNUfBjZFmcQ0tynP6g2EeUoZZdvruF0aO0v/o9OiAj4s/UQ8BrfOEjJ1mMrncAZG/nReVx8hDHgePlCHk7/KbrPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465531; c=relaxed/simple;
	bh=ICxTRZjzMmg9IW7Nrm6IGPlTPk9a2fAORh0DakTW7Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bL/lYd+ZVNMLJyxRcwCt8PtYYc8JLtvn8gpwij9o4YA38LIO22tg40cq5/GE3bmkQkyev9BKZjBfTDFDWc1bNXOrwde60emwc2YvkxbZV45xVAmJfab5X7QyQudMDP1mPSRUWrMwH531P+i8iTOs46poI/gZ53qlDBN5eP4eRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bXVBQBsg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bXVBQBsg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DD91F0089A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Oct 2026 13:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465530;
	bh=ICxTRZjzMmg9IW7Nrm6IGPlTPk9a2fAORh0DakTW7Ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=bXVBQBsgo/q53L78ozjnffsymfm9EZyIbLG+iFL2fgqdUJZsc0wcRQpjiYlyZXckd
	 uZ+kTz/68x3V8B9t/KT9AwlywkTa5adSu5o54S73XIOhk+LS+4FlpK9wEJ4hJFy54U
	 M8TBHQdE9tPdo3TgSSwfdndbuoHKaBZiClrEJqDVJ/znq8idGPvmKzLX60i91k/d+S
	 5Hp/lsK41tgRtY3eKfGtJVrqZIPbUg/ORX/5aWC9ZNfFD+mA9i9c/dkThtCe84fy62
	 nvwz74I+fMRG76RUc8UUQu9JprRBst0ecIx3/kRJS/TGH7BUxN63yWN46f4eTi7RTE
	 qdy37bMTyHpUw==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48ed0b68895so1751231fac.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Oct 2026 06:18:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7/xcWSko08q4UAsmT8tut+AJaVmbglGOHiMiZO+zqTKdEn+eFt9Ci6nKwbHg/n9Za3pA8fwsXQzYcuBEmo2CT0g==@vger.kernel.org
X-Gm-Message-State: AFuF++mHCCf9CnBP4dHFk8rMndSczOmx0Kj1d9Qz7DVfSYbwL9/fh12Y
	Bh+UCf6RcfmHvQs+rcd/plyx9vTOU8pRjVu8OtEAAlyP5b+PsVCGbTb1xIJ6Qxnlr5jY5pbsQG5
	mpvDVcWdjXY9hMBw5dCxujfs0TvO+hkM=
X-Received: by 2002:a05:6870:41d4:b0:48f:e363:5cc6 with SMTP id
 586e51a60fabf-4a25959a053mr4909766fac.52.1791465529385; Thu, 08 Oct 2026
 06:18:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
 <20260928-mali-c55-renesas-dts-v3-5-2cf7eb746ebb@kernel.org> <CA+V-a8uam6zpuFoJURO+YuiYLeckAYvEAOpF5cZsH2buBsfLBg@mail.gmail.com>
In-Reply-To: <CA+V-a8uam6zpuFoJURO+YuiYLeckAYvEAOpF5cZsH2buBsfLBg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:18:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLkN+o=0GAvX=Tij9+qNSJ83HNSd+u+3W1gTbfM3GMwqUA@mail.gmail.com>
X-Gm-Features: AclHuK_x2nw4wjrzHuerUcvWMuYeScfPfZjk2PzThc5BYhH3QlGqIjY3dXHMudw
Message-ID: <CAD++jLkN+o=0GAvX=Tij9+qNSJ83HNSd+u+3W1gTbfM3GMwqUA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add
 ISP and IVC nodes
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Oct 6, 2026 at 8:33=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:

> I was trying this on 20261006 as soon as I start camshark I get the
> output below. Im using IMX708 sensor on the RZ/V2H EVK. Are there any
> additional patches required for this to work (any sepcific version of
> v4l-utils/libcamera) ?

Do you also have these patches queued as fixes?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/dri=
vers/media/platform/arm/mali-c55

Yours,
Linus Walleij
