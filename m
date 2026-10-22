Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792644108;
	b=er641d6cO9K2FFOGcW8UJeve0qTptVMQ2f0Cn9bRydWe8QwiIwmezorEx0C18wEwoqyv
	 BnkKjaehDN28E6sdNmaucxEVh2cSG3xZd1HkJe+mOpUTNqA2tb23dQehuL9jzoCw6SMLJ
	 pS2WZAwf4F6OmN/sl/ta+AvWc1dMFaieS81HlLPBcHrYiGoAIaYSBGk3SqNC+zxs06BZa
	 NHT/kYretraSEKv/S3kizSnDWcCtumNDsJFWQNcK9VTRGS4ldba8+EscdkQIotj24M3ah
	 ZJwj+0wtIc5cElkHNEjB9ZRgbK40gG+QM7MfjjEs7akqvmAOuqEbZzL9D12h/ozAp+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792644108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
	b=3nRwRmFVPaXkMHka7NBYVYJEELVndyd/q/FzB9ilfSSVYSwUvAkDZyyUkGzkhz+xkZ+3
	 E1vlI3KxXIGI0K2cerNr1jbzEBe2GanQf9jkYKNkMCl24srrPcvFhfrgaBSXgsPOz/BFO
	 AnKAL0qoYW4GUe48ljLcXCgM53crIN25Mvtv+kUNEUrFh7ImO9LALnL7SBSdkpqqdnpwo
	 R2t8WeNs75AS+iM++2JvWCMLFXcvIBa0iI6xd9Vf8Ekj/ryKLiOkPNuxperKvcvujwEVQ
	 /7REYE+47WUgoCEbdMQ/5K9DPZ2Ern7rcpnVDsLmMiYbJk/tg7e9PhAGNl8gq6AdjDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1TyOzD5;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB46606A31B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Oct 2026 04:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB46606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E1TyOzD5
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so487934a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Oct 2026 21:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792644107; x=1793248907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
        b=E1TyOzD5bPpwzVqP5br99+6oh3FeSycO8lcfeW74GAhw2rlpgT/M/FF22LIEXTZPws
         kMjM5K0pNbdnWtqZMaR7KrlD+xif3ghDb1IEKVr0vXuA7NcjjUPPySQvRRAihPHtRf9c
         D5lWNU++NIx4AZi2w43o+3IgjeuvoBoiTLIfCZqRY8RSoxHhTSgrE8kg+T+HEgrz+9Zc
         wozz2wgsYHkBzBPSyJvixXoUj7D4FqX+jXIsUehMu6KS3+B4SzcKoa+FxYjIHOaGtu6P
         aGAdzRCj/zFPL8h4c06TnKJ/sSQT3uTHAiPmrcaXJbQ2t1q73Xmdb5XMksw5GJRxrnAC
         14fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792644107; x=1793248907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZUvcnWuT7preQmdUj0IGAmH2t9+0AN8QU0XIqBZyog=;
        b=lHsIOPeK1bXvATdzeoRFz+7w0ZPNftwkZWrcZ693haO4lOavegViJ3OWIaYp1TCv+2
         +lbe2UyqYrTzrfsDJ88DVtXYMEIl65vZNwzoryD4sAsVu2SvOnrTqI6m7/jlJPcqYlVK
         xuJ6oEFWbMNxf0t+z9u2K17Ph1Z3zNZvx/VXlH0Gfcyuiw7ukDIMTzEavCN7VCxsYJ8Z
         h3t0Y632rvlGNA6w8P6R8ztjhBKUil2/k5jLfuFk9ucUIdaKqg7PZdjvBX2/+ZEdrbq3
         4//QHt+yMXFz0C7OtvjA+cBRvUFOlTGCzu45IHh64p9pQrwu0bdDl1H9wIS0MDhiTPT7
         9clQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEQklj+eRfVoHNYkIpIY+A911OP6Sjb+YdyG7oQIKHre1UwYNNmGLcWgflRwnjvPK/S1CNfEpnjELei+d4dNlioA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLUC4wfdKCh7hMzc/x2+YseDWh9rDBdw9Y4bCmkujTggTutA1XZ
	RCjsVJjaWp9GOtHU+3sNi+L1wS45sMHbIWXtDTQHe98HdgXyfc+7TA8z
X-Gm-Gg: AYBFou0A1fW8s4UN4uYvi8OG2f7sV7kslRWNcuZMAeHCe7SHalRJrcni6YU3+bCcWyk
	4uxU1qHYHKkukHXiVcOkrO949FkbW6UdShXN4hOgusxBecnmhsXHbNZo7lBwZLEQwVpLH6CFjPF
	quaWl/Tu6C7Ffiy/l8kRZeh/tHj3HEvgzu3ztqT48dk7BwVKe4OlWYSOWOtR25TqtG8+8fWhOFV
	42lPDDUCk+I1qhRaRPOXURssU/oNEyanXWkn1okj03IOR/00MzslOACTmaG5coDDe94atPKTBj+
	Kqi2GfNLleepnaJQxqHV8QzHh61afQqAH/2+NG6rhaIyH/KZUWuyRXN58gDTu/xfd0x59X8murX
	kx3dIOvUH+QHC51DFTITNlTowyEO4dnhXDwDrdp3+Idkfbw6j3j+l0Ll1DrJvXWM/S9YiaLlDpq
	7nB65LsydEjkmwiHjR1YdfdAMpHHqWD/xkJP0lM4zq4821ByN2wzEKuSeAqmHnvCSrpPVZf6zq1
	ddp0/qjqhfVnppvEzZ8iop6ClFxHlh4a82SPhX1HDepKqeu61+6/UdlJrmt2ULGOY5AGnEU34th
	FTPYt49vQu6LGA==
X-Received: by 2002:a17:90a:d443:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ad86d07086mr2617064a91.28.1792644106885;
        Wed, 21 Oct 2026 21:41:46 -0700 (PDT)
Received: from archlinux (d173-183-236-7.abhsia.telus.net. [173.183.236.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f42d40sm3351291a91.2.2026.10.21.21.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:41:46 -0700 (PDT)
From: Artem Novak <artem122novak@gmail.com>
To: geert+renesas@glider.be
Cc: daniel.lezcano@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v2] dt-bindings: timer: renesas,tmu: Add SH7305 support
Date: Wed, 21 Oct 2026 22:41:35 -0600
Message-ID: <20261022044135.275485-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SH7305 compatible string to the Renesas TMU Device Tree
binding.

Exclude SH7305 from the mandatory resets property, following
the convention used for older SuperH TMU implementations.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
Changes in v2:
- Rename the compatible string to renesas,tmu-sh7305.
- Sort the compatible string alphabetically.
- Exempt SH7305 from the mandatory resets property.

 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index b1229595acfb..ed30e0c861c5 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -51,6 +51,7 @@ properties:
           - renesas,tmu-r8a779f0 # R-Car S4-8
           - renesas,tmu-r8a779g0 # R-Car V4H
           - renesas,tmu-r8a779h0 # R-Car V4M
+          - renesas,tmu-sh7305  # SH7305
       - const: renesas,tmu
 
   reg:
@@ -110,6 +111,7 @@ if:
             - renesas,tmu-r8a7740
             - renesas,tmu-r8a7778
             - renesas,tmu-r8a7779
+            - renesas,tmu-sh7305
 then:
   required:
     - resets
-- 
2.56.0

