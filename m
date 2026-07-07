Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D848736DA00
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435905; cv=none; b=Zw9bRbOiWOEY0g2L8PwMHTKqM00TQ1kntWrkbYboKeb/X4uLFCDi7grPK2k+ZSIHV8fsUNLTKXkpgqimuQIwqXJp4gXq1xheSHhhVKIvmFO6TzzqRe1usP3EpZNjagyoViV7UnHqtJsdyD/T6P1X3y9CZMEOKwArE1cLxgGcVG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435905; c=relaxed/simple;
	bh=3482tVTc1e/6rqsx/Zre4BaqdTWNwLcSRHDPFed4KEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xo+6qPYxa5WQdYPhmM/w29BGjgJiblrciSZCtXfJrPm/UWycVszH/5+RSUAe7O964DhR9BI8abMMvsWi0FAY6iisUbj7Lb9X8zpL5swJ5yUxAfTsqVYEYjNt53l3tgnpx43seQ1vYiDzzX5TyM7YWWekDqGxAuSvT9PBHdD0LJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMofgjP3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMofgjP3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso18629935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435898; x=1784040698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0NrUAeAovRNiUS9LYfXTT4948XDdYJQrdiKXv1/xQ=;
        b=mMofgjP3yGPC4BJ/Pg5ZTx+XoNwcocU65DMEHq7xhqoCuCVVLSys/OWH+xkRm2EHl8
         U3IE6aMlSPRbmp4yUyP302lNJY2eM2+JgD+oYouXTREqTUzKU2/c9rn7DBhQljHYjPYu
         PlkeHmFAns/YYqPjsmhLmjLzr+YwF2AYX2jXmHn15ebTl08kZiPQ74q77HXa/SFuoQpo
         +aq7JWdoe5Bsu8Gq9hSVJJDDDhvZGPa5YtXYyu9bAFTLGR/tbF9k9Z+GZFu84u/5uQXx
         qdupFkKyLyAzj3N2FGkadGfu2TMVXRdiMi6dgjjQCY8mY8DUXgtpXjTaiDYSk9479R4S
         XD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435898; x=1784040698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O0NrUAeAovRNiUS9LYfXTT4948XDdYJQrdiKXv1/xQ=;
        b=ibHcsPbLJbeDKLP2XSOvzhoGenZgNucyz5iTELNDW83zpEbMd7VASxUm4MBKwfeaVo
         ndI8bcVqtX3iUSu3Tp3CdefxUxMXiXP4oL2y+gCpf8swK+kp5imhzBobHCBgn6l6DsFT
         o2WFWLXWE5DE9ny3mkp5A3ZJ5HOU2DKBH1NNX1AHsPkf7G8iarZltNQO/bOcAJ7U+zAw
         j15+OUzKfFS6CQYLVAoBBpTF7mAKFpDbut7jaeCAVJo3McaYKtplhayW31oHm22PU7ZI
         Vk/znsvHp7URzNmVeJSGNesbJ9XSNSj71JEALi3VnBmeC1zlPzcoRI8ixeJAGLrzerkL
         bzVg==
X-Forwarded-Encrypted: i=1; AHgh+RoP+xswp5R53Iw/cf1b86FZWCwURFszU2JNkR9KULQB2IfhhkO1KG9yDZI8/UdpP+8aexRF2/gTzUd48FLINczNaw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl9j5jvq6t2q14p8eWdfVbnd2P+Fh8e/8xifmbmED1lRRxLOnh
	KfFd9LyhLVrJAUI6fEbfkUWLg1nsxpcdxXM05z9KqNPvLblq8Zj8NjK2
X-Gm-Gg: AfdE7ckhJddf1ev4zNSKZtcrRnwGV9K5OMeLPkMUt+IO+hrjfWYp7AN8uDfUTKJfXno
	Upt4AyH5h7ZjfcR5xvwGjpPSfKhHRtKaHVGDnlP7PWJChwRZCl2GK44viX7wJMmA58sLBgkUKwG
	apRTtB8Lvj9FLEHZj9nIB5Vdwn3T0jQOO8sByNknBZVvFpZ8w1K/5bgpVyYpZsB+PsuOfXaALl9
	ybJio/46vkU/uubT5tZsOVhTJVsc204vX8yANRFovEjzoDGZ673w8BboX78n1NFlJ2lgldk1jUI
	qhaIzdo4BxUGj8MrSsN8cYmuceEDiHXmk4x49d89QK08jcnabPQfmb6aqey9KTNk6ezWh1rqAy5
	FWKMpk4HntSeKT/A8gcca07nbx5d3cCJfDQXe2DnpAYIkidYY4oiIFPh7pl91Rick2HQbWmXmF+
	KZZsIoXccrROkJYU8l/i1Xk5aQyIIHAzBCxto0iA==
X-Received: by 2002:a05:600c:8119:b0:493:d2b1:48d2 with SMTP id 5b1f17b1804b1-493df062c54mr66322825e9.2.1783435898312;
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add RZ/G3L USB2.0 function support
Date: Tue,  7 Jul 2026 15:51:29 +0100
Message-ID: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,
 
This patch series aims to add RZ/G3L USB2.0 function support on RZ/G3L
SMARC EVK. RZ/G3L USB2.0 function IP is almost similar to the IP found the
RZ/G3S.

This dtsi patches is depend upon [1]
[1] https://lore.kernel.org/all/20260707143646.245177-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
  arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 function
    support

 .../bindings/usb/renesas,usbhs.yaml           |  1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 38 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  5 +++
 3 files changed, 44 insertions(+)

-- 
2.43.0

