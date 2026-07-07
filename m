Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220D636D9EE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435906; cv=none; b=Qrdsx4jrgVsekiKeuQyrd4n2df8HZeRPuBUJHdLeiilETg0KCtr8upOP9k4YdIf8xa1HwtDKhbFvFAU0ePQrSzN9FKLaNcLKWH1BA5sNDNIo3f6HHi8UNHrlsDkHx+6M9c8uIFhTNHV/LPOmRQKg+t1ZlwxZ4KQeX6DwKDZSNhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435906; c=relaxed/simple;
	bh=yO/cwkvvW57lFL4Ma8QI8Y/z1gUwyT0SmaSmYJtTWwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RZLXejpFy+XVrPK/342fndf5m14Wo/gtDXSsj0LWE0UwNEiYgeOfRUfcW2/MtpAWVy7fAxj7kZvdvaibLQ6mUmcQ52f1+BnEgmxLLsDNwVIwIx3ciYmI0jSybWhY9dKJAYrkv1/sdVhcuzyftV2ulxemDU258LGpt7dBaZRuNFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cil7tACw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cil7tACw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so33450095e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435900; x=1784040700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w/s86zTxnPOiSyACjOQYgToZnZqdntjQb7k0uoRuZCQ=;
        b=cil7tACwzvqGB+KL/Z5ZPa0yjZd3cuKfcXHBqsq1tGEfakd/48nnFD8Bbi0KfmyX6k
         DSnbMsC3TomHDNNynpUXsoG++5Ww7eomYIapdHhJN8wGOfUO/l4NZQtLln3uvEimYbLy
         04HonySTtBh6zhUJYCMO7jiH2mR65YMPj0hDwCHnddQlrRFKUnYKFSpV70vrhIA4SczW
         4RC2wbSq4yKguDuIvIY/BQY4UNBfj6Bz7RMFxTg8K7b245Rh4FvLwfJk2kt/+WK/dgnq
         R3FKpwKjpPDdee5YzL8+ubVM/1Yp9+MowodTa5xhYDgeCVV33tlU2XCsqtCwy27J4gU+
         IJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435900; x=1784040700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w/s86zTxnPOiSyACjOQYgToZnZqdntjQb7k0uoRuZCQ=;
        b=imdked0K3Apb3LzhBPc5cOvPmIzdDfCXGN00EDFcfJ6K+wguJabohH/kvNWS+SM18T
         rpRK8Otq9FmbHyvEL5w6JvdWXR3WZom+daDWxc0W6B0B6vA1EXoX0t0IS0xeKKIcFOvJ
         t7AUihqgVQYwTWeSgP2gi3mvcci0tFrlmwZzdqamgL64NVl4omL9YNTImDm+QCedn+Io
         woYNOnJs590tjjvSGYcp+KiqAWhUs1PzYp5uu211vocaSw6JhedThaWXk1DWYkROTIdz
         iX1SXW2+qv6X44ALiZfkH1QVrkQ7ObynOkhVGhNhdnf+k7LZdCS5bg0dI9dgbO1t5exy
         bBZw==
X-Forwarded-Encrypted: i=1; AHgh+RrDLqFYyqlw1JOMkvJi1fKVcCnKsejibdRwPlC5y6HJrPS3xeS9sKzAqRhIy53DHHA0CTfcwdg31yI6v4aZ3JxCQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdKHM7pGCcKi/nT+oLZKZLTGwf1f9HXlswI1cZXrGc9Rny5XfN
	mUzKkGbf5pjJ8p4MKxXoUSy17Pa1QSt8SR9CV8+ZXYURh3NdB4zeOWiC
X-Gm-Gg: AfdE7cmzweYpJqjcMGh2QBhFGJ/aVXIMCqBrcBknNeSzQ97lAcLJbisVuMjtiTXedS2
	yLy7kQWoZk8IDq1dhU2EwjGU+vdF4tSOWLalHiB4DzLroI60GCzTBtEowUlsOtN3jZFtzPdPv7j
	Ginxyz1eon8w4zVtKlBfSTaxebaovYL87Oa9kLUZRLYvN3ELfZA95Uwt85YRaRtkLHqU7flICxK
	SJyb5r93YHslWRosbSx6kxjuvrer4w71FEaXxsikbS7HnBq56uXvNTX9kCWQDCUtA4KR3msBwLW
	aBakd3XGrUHhsyxm8kif7EuNTFONkY8DgPvjtkkoBCQXGOucPYOhnmQickE2KrkTcP7uvv1eq2/
	9Mowi6bhOSZrh4AzOA46s1HvTw99EkuoT5PZgXN6et+wGUtzjanWS4E8a9f7B77jR5gevDvxJhB
	SZahikohuHH2xrlPCxsz3eRiyrin2LNUFA8t5pR3oVkLv8aBLu
X-Received: by 2002:a7b:c00a:0:b0:493:bfbf:1da4 with SMTP id 5b1f17b1804b1-493df065f71mr44810015e9.22.1783435899133;
        Tue, 07 Jul 2026 07:51:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.38
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
Subject: [PATCH 1/3] dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
Date: Tue,  7 Jul 2026 15:51:30 +0100
Message-ID: <20260707145135.247565-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
References: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The USBHS IP block on RZ/G3L SoC is identitcal to the one found on the
RZ/G3S device. Document the RZ/G3L USBHS IP block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index dc74e70f1b92..13715b7c94c8 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -27,6 +27,7 @@ properties:
               - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
               - renesas,usbhs-r9a07g054 # RZ/V2L
               - renesas,usbhs-r9a08g045 # RZ/G3S
+              - renesas,usbhs-r9a08g046 # RZ/G3L
               - renesas,usbhs-r9a09g047 # RZ/G3E
               - renesas,usbhs-r9a09g056 # RZ/V2N
               - renesas,usbhs-r9a09g057 # RZ/V2H(P)
-- 
2.43.0

