Received: from mail-ed2-f9.google.com (mail-ed2-f9.google.com [74.125.228.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F5C39060A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 08:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425507; cv=pass; b=i0L0gd8znEkxETXZkSjS4+iJ3U/7zR1qZntFWr+axybfHTk5TbRGuanQTNmtx6HH7lKA71FNYh4fKh0PH5/mnkggr19lM6hHTbEH3UCaoMvB+22/H28PAeiEE5NSl2PFOZo89QnpgDRV+n+fHTMCsXS3J1gH4zNToxmwATvk3wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425507; c=relaxed/simple;
	bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/H57IdN6u5T6ejMS2CsT2g7YWCTN099k7gQTT01578FYC1cv/TFYCdBwYQ1RVuHsrWxkiuoizNRbJU5bssKq4fEuIJQj7/8HHRS1b/w9EV7NtoK8WD3xJQrHYIVFQByNOsbKmXBwKN6O7ek7rhNLcfsJQI8rXy/nL9SVUvGKyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2bDsdyi; arc=pass smtp.client-ip=74.125.228.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2bDsdyi"
Received: by mail-ed2-f9.google.com with SMTP id 4fb4d7f45d1cf-6a64841e8a5so1077433a12.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 01:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788425504; cv=none;
        d=google.com; s=arc-20260327;
        b=LOUuJ4cU6AW51osaQCqAyPdPtA1EZUJf4FJt5cqKzVUB5EX1pfjQsCNzIcsZ127xLA
         Zin34TG43WdArfEa4cb0o97W951Z0GlrgMYudagnnZKCCdkfL4ZuVNvelX1G4jdMQgkQ
         Mb8SL5BaSFohTr0q9HRotpMlhhHKaAUzHeC/hVLEEVDpIVNt0iV/ql81V9IR61HS2wjC
         14CjijfnOg5PocVoy9+a5dkjjjVhU7eRqBPZAVDGEJRI+H1cR/TeSPaI39WnBZ8aIKEi
         NpFGeDGy5vdf48d49ibt3ichWcjOc3p82omgHC7Ae2n39z7758ooIkACkR1ia2hhW2/y
         6paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        fh=RsJhCHnwDwSyX8BUhaNj2mlWoqo+3LeWidVcyjPMhP0=;
        b=kByuCEQSePaL8hGupiIXXflCsY2YlhDtzS03022l/1fGSPwHtK5OOZg7vH1GPDevj4
         atajiwzJk1mnrLB3/uF25in4XEBzCed9wZIoAyU4sSgiYkji7ecznV/OdQ6bBVO7HqYF
         tE2RTpia0DiuMmapAtJWXJHoLhRKYZ2z5K4sVPKCK2NLobPR7hrFvj//mNp20wYlRmz7
         LL2zekHJ8eumKd8taWQKPLB3QdOiF+Jp4OqS4M9MFm9zST0iZCpRsjCxOxzPryxpgLHr
         /w1N3K4XDPhmpPecIe7Wv6Ryeg/3eSzLGEqy6a6PCX6EdshIBjR6BRMwHyZ2kA8L79Ma
         aPIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788425504; x=1789030304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        b=B2bDsdyie4uFLTSvRBI5G12tsRKBuEEPJP2lgXhdnzVTTLvYhGvF9EJ4Yc57LHB0OQ
         IBKSyzlieVHR7SzT++4+YZIW5ow82U9CPLW3Ajl7jRT83TQqXLUikvvirIpUzvTCt3lZ
         IeMapLnCg8QxqKZZaG4PNqZUTVbCxOF4soa/kJjmtmrTmOh00na+Ci1KnpYznJ5TvHWj
         7UxxIy+S7RSV3zXvLZ+uvjE1XWNnxNi9yeCwi6rrsFXRUxgv4/43OJ4GEA73qzKUnUy8
         ZoL7PuoGqOCagCNoSpRWdso+efjSz4y5eKXEgB3wPi3xpJwFkcHdog0NZNn+omepYfLu
         yXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425504; x=1789030304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edjXy2PN+mcza+3kZSGSQQ3aYOZGZOPTwjWGFZXSb74=;
        b=aWSoA5r40HgZFbd/ahJwg+cOugppBXRSozV9vvzwCwJ0NxtKB99hxbBDLQBmIr5e6R
         z3OPcCPCw3JXVtgjapRbwjgWw8XPqc8CiSxri+3uIncKb33mUZlaQuc2sGw8tMUWc+Zv
         oGcKry2sO1BkOKDh6XKKqD5dtXKM+DuxreQaZVeIlKAbVFS0GDc2JXL99FwULbUhFRvz
         3OzFqU9jc3VWZoT1CQwZd4RScDEgIHKcI/Io7NoZl5QQYcRKR0UFut4eQiA/oVm2m+Sf
         UwgHmcd8RMMqcbnX5emvJmaS0kZpeLmgaojc0HK2sFDtC6NzSiL7GOVa5Aa8HMukAHrB
         dShw==
X-Forwarded-Encrypted: i=1; AKwUvByIMw8ZgN5FtaG67nhortqgT3sspppIk899BWqmo9wqMdSic1f727U710xpdO7l37pc3SYpUm+2SBD0Dj8vI1i9fQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mZO4IFBEXx2rGMiFeM/JeqVS0hWGsooe8wkpxnUCZYOZ5KFV2P
	+tXTP/DZfiQopPCRsMu9hiYXIo/fZ9wRH2HXgohKqwz3T+AadWU7R1lQg5pcSRnj8+XKJHZSArD
	QeJDcGpNgLa0Mzv11Iw1NM5/lO3tzFpg=
X-Gm-Gg: AYBFou1uMrw98N41Fg3/GuSSKOZupxFwtNXXiaZRRWmhh0P6bLRz7gAvnNW3bctqHW0
	ld04AqjM/pIZCVfEcKjlHdHtzyuxkgU/ZkYjEN1/ni1a2dezBCdkbtUOs3LGAOADNT/LWWmhsqo
	a/8lfST0bOd0dBcqYYTXmT6MmTjhBS4urI/WesWDfwKo0AukzGjrFSsJnAOwD+5/bOKibzk0K+v
	mPmG+v5eD4EzQRdnkpxXZwjmuxX7NOZn42Q0JAHIgCE0zzgNG56/+w1eqMXHY4OlAp9SdGfNIOE
	sGm8RzyGJqkLWAIChle+QO51gv66o38hWTGXN1FHFMJDY2AYZgLzWJqQtr4=
X-Received: by 2002:a05:6402:460c:b0:6a3:87b7:b516 with SMTP id
 4fb4d7f45d1cf-6a68313fb0cmr6808251a12.6.1788425504326; Thu, 03 Sep 2026
 01:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-2-coiaprant@gmail.com>
 <0dec5462-f6d5-4ef9-9d02-5fdf7f3090a0@bootlin.com>
In-Reply-To: <0dec5462-f6d5-4ef9-9d02-5fdf7f3090a0@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 16:51:31 +0800
X-Gm-Features: AcwNN1VVEgAP8GgA8LdwjKHcWBmFmP5U9Mjud48d0pq7C7tHDzymcLYpjmHugJk
Message-ID: <CALj3r0i2msRXH-uqA2QX=cRkQwM_H2bFH9GiroEys2NfEbTtCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 01/10] net: stmmac: move XPCS lifetime
 management to platform drivers
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Shawn Lin <shawn.lin@rock-chips.com>, David Heidelberg <david@ixit.cz>, netdev@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=883=E6=97=A5=E5=91=A8=E5=9B=9B 16:32=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi again,
>
> Sorry I had a second look at that after a good night's sleep, and actuall=
y here
> we may regress. The original logic checked for "pcs-handle" presence, the=
n
> for the pcs mask, but if no PCS is found we didn't error out, we returned=
 0.
>
> This is making it mandatory to have a PCS. Please handle gracefully the "=
there's no
> PCS" case :(
>
>
> Maxime

Hi,

This change covers all callbacks that use `select_pcs`. Drivers
without `select_pcs` callbacks will not have their pcs used by
Phylink.

Currently, only the Intel mgbe driver uses xpcs, and Intel has also
set a mask for pcs-handle not set.

This means that on Intel platforms, the parts that implement
`select_pcs` always require xpcs to exist.

I think there shouldn't be any problems here, but I agree with you,
regression issues can indeed easily occur here.

Best,
Coia
