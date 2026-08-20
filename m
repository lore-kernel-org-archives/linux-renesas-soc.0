Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A36346A0D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Aug 2026 05:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787203582; cv=none; b=V2PbuDOwWmTykS3O74Po7qnwErvY5v8Ot9B0tVKu5nuajshQrL9eDdqk+hTvZ4sMGXPfnaZsGpn3/AX/Qcymjjzp2N2bgVSbrK45OTmTUjzYzIIhCf98s7VJ4QeznmDRN5gFh3PHOXQjiYPV8i2VXWDe6I/M03Ggvl15OWkzLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787203582; c=relaxed/simple;
	bh=g3+VErzrmJ1Q7QbqM7CpgNSO1hDsSL3qFerYtNpT1TA=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=qcnOy19SAxZ0VTFcFyHPFs8Fwa95ZNc5H6c4twulUOxwLOgxugNhCTCyL5ecbCvVVihQOP+DvbKLMZK3DD3H+b79Kb/jM+KA3lDvTmjqpL0ZAZ586fMz6NH2cqQTPEFCyiWPHAoV82ncVUECftLxK6iD6zTOpKHlnO7v1SuSqKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8Qzvbxf; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8Qzvbxf"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cacb8416a1so15625945ad.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 22:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787203580; x=1787808380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHAUdvChFETP+1wGAbo+mta0XNMI5vFtvZjL1xhL7MI=;
        b=I8Qzvbxf6DJfLJAlDV9CDCBiWLzjjg1pQCw8NHiiLDtXChEqqzLO6yBi/MbGXjY4jt
         1nkc5lfuP3xBWZgWsSW6YDDT77ufrcraNgYOa07Yj545szdUodaaTE4yNJcqc6alXof3
         qT6T4w55PbLbL5/YuvelZQoEO/s5p9KCd88Q7MDdZTG569ZZhg7oNA1Na+zl/UqNbzLK
         25MRxHlem8VdpNGK/YqYkvT5WcgoYJxxAbYYIdODWO075In+F6StZ1rxgoy8NX8TXo9y
         gZI4H2vy4YeBoAkU1eMK1NlP524/cXCIpObknmKyNT3kUP68sIc7Jzl40Jvma888pV5z
         e2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787203580; x=1787808380;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mHAUdvChFETP+1wGAbo+mta0XNMI5vFtvZjL1xhL7MI=;
        b=SLb06kV7Yi4WX0CQeb469FAbWjoKbRF3eEJLp0aJ0PBrhBLeXoN+7KaGXaZJjVOYeA
         /KVf51G9CemS6CaZkAttu/dtvmp1+oAVnWYvonVGHLbcgcJ3MhvLsB+tdalqUUB0MCoj
         fP9rz8AaDvNy9sbZXW1ozW9C6VjjQNZXMorPeqHq7AUJ0xd6G+fl8VZDG7LTA5ajo2NH
         aFCqxNn8oZ/i9v9J4Wm+M5sIi7m75boxpdOSiSXcQogF7OP3UkY0vnWdHYlUiDevd8LV
         F7DfJTv6Bemgd4tR5rts/oyDmfNYuy3lnpHDzhONRduv6S23NE1PW6yUzp5/0b8q9MeX
         2Yog==
X-Forwarded-Encrypted: i=1; AHgh+RrJJSMV77JgXkXMl9SMmEV6nGFUgRbgxwf0W/C/sMhbRmDXeGIMJlDle6+XvVlrEW+cB4EELQgmGaQttULldrFrxA==@vger.kernel.org
X-Gm-Message-State: AFuF++mV3rqPe+WLKEfQPygA5rKNyuH1lh8Pse3VwiijYp4//FkDwkVg
	bnXyOo3aEKBRWz98m+khneSKN0UoOp3XGXHW7ZrSFRS7BgyF8wzCSELX
X-Gm-Gg: AR+sD132WK86XfzU6mel6YGORjsbbnqREYF5WAte+iR6bYGflW6j+x9vp2U88vrp9xN
	bXZUFqAI22l0u8pC8OcON3fFeIjk4leUfTjmx+sNuOTAgZpRLHO4LjHm029w9aYido4iRi5a39g
	W6S3vbfWQk6t+D0GvMwUhdmiDXUboz9gskPmwmnTIwDnwCRERexAyFC/wCFRAXWkStdC25kHaUu
	EbggFRSZ7NJkX1RIm2K8J64qSFJFw+OEtOZwZ9eQ0Qxk1TqZYwNbQhNkVhKUuHGGiDSWpEnpy+5
	NP3axKczCt0/y2sRLcZY7yTofy+5UC0ntXXPseIDS5YMDGZEXBFzVKTPDSQpu6CIXFrr5cutkPE
	ad7cjhk7bQINt7uuO09Nt5pVdWy0YNx1+hOpByFqg+nN+dseU+amLIPpcBnldRKvW75iLfQj89R
	fbLh7zd6N544WPGyhBc8hXKA+27Smdz523RX0P7+dsrejNw0tlt+W+t130hVlgQXUqt7nEgLbEc
	E8lqTmzuCyC0jrQx/FTMu4jWb6xsvL/WrVSHhrCULj/WDU2K079y23z2A==
X-Received: by 2002:a17:90b:3c47:b0:38f:1a2e:6e56 with SMTP id 98e67ed59e1d1-395813f4f3dmr19559280a91.9.1787203580000;
        Wed, 19 Aug 2026 22:26:20 -0700 (PDT)
Received: from manush ([2406:7400:94:f2e0:d835:beab:fb3c:3432])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad53874sm20588987c88.4.2026.08.19.22.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:26:19 -0700 (PDT)
Message-ID: <6a868ffb.2915925c.31ad32.38af@mx.google.com>
X-Mailer: git-send-email-equivalent-ps1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: yoshihiro.shimoda.uh@renesas.com, michael.dege@renesas.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date: 20 Aug 2026 10:56:19 +0530
Subject: [PATCH v3] net: ethernet: renesas: rswitch: fix device_node
 refcount leak in rswitch_get_port_node()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On an of_property_read_u32() failure, rswitch_get_port_node() set=
 port=0D=0Ato NULL and jumped to the out label before releasing t=
he reference the=0D=0Afor_each_available_child_of_node() iterator=
 was holding on it. Once=0D=0Aport was overwritten with NULL, tha=
t reference could never be=0D=0Areleased since out: only put "por=
ts", the parent node.=0D=0A=0D=0ARework the function around for_e=
ach_available_child_of_node_scoped()=0D=0Ainstead of adding a man=
ual of_node_put(), so the iterator's reference=0D=0Ais dropped au=
tomatically on every exit path. Since port is the=0D=0Afunction's=
 return value, take an explicit reference with of_node_get()=0D=0A=
on the match before breaking out of the loop.=0D=0A=0D=0ASigned-o=
ff-by: Manush Prajwal <manushprajwal555@gmail.com>=0D=0A---=0D=0A=
v3: Reorder local variable declarations into reverse Christmas tr=
ee=0D=0A    order, per Andrew Lunn's review.=0D=0Av2: Rework usin=
g for_each_available_child_of_node_scoped() instead of=0D=0A    a=
 manual of_node_put(), per Andrew Lunn's review.=0D=0A=0D=0A driv=
ers/net/ethernet/renesas/rswitch_main.c | 20 +++++++++-----------=
=0D=0A 1 file changed, 9 insertions(+), 11 deletions(-)=0D=0A=0D=0A=
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/driver=
s/net/ethernet/renesas/rswitch_main.c=0D=0Aindex 6fe9648163..ffdc=
42f430 100644=0D=0A--- a/drivers/net/ethernet/renesas/rswitch_mai=
n.c=0D=0A+++ b/drivers/net/ethernet/renesas/rswitch_main.c=0D=0A@=
@ -1303,8 +1303,8 @@=0D=0A /* Call of_node_put(port) after done *=
/=0D=0A static struct device_node *rswitch_get_port_node(struct r=
switch_device *rdev)=0D=0A {=0D=0A-	struct device_node *ports, *p=
ort;=0D=0A-	int err =3D 0;=0D=0A+	struct device_node *port =3D NU=
LL;=0D=0A+	struct device_node *ports;=0D=0A 	u32 index;=0D=0A=0D=0A=
 	ports =3D of_get_child_by_name(rdev->ndev->dev.parent->of_node,=
=0D=0A@@ -1312,17 +1312,15 @@ static struct device_node *rswitch_=
get_port_node(struct rswitch_device *rdev)=0D=0A 	if (!ports)=0D=0A=
 		return NULL;=0D=0A=0D=0A-	for_each_available_child_of_node(por=
ts, port) {=0D=0A-		err =3D of_property_read_u32(port, "reg", &in=
dex);=0D=0A-		if (err < 0) {=0D=0A-			port =3D NULL;=0D=0A-			got=
o out;=0D=0A-		}=0D=0A-		if (index =3D=3D rdev->etha->index)=0D=0A=
+	for_each_available_child_of_node_scoped(ports, child) {=0D=0A+	=
	if (of_property_read_u32(child, "reg", &index))=0D=0A+			break;=0D=0A=
+		if (index =3D=3D rdev->etha->index) {=0D=0A+			port =3D of_nod=
e_get(child);=0D=0A 			break;=0D=0A+		}=0D=0A 	}=0D=0A=0D=0A-out:=
=0D=0A 	of_node_put(ports);=0D=0A=0D=0A 	return port;=0D=0A--=0D=0A=
2.46.2.windows.1

