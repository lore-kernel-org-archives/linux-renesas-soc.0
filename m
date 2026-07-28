Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B1041B36C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jul 2026 09:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230057; cv=none; b=cn+/jW14oomx3tY77fw0WMIxXIjM1E12lcNB72mZ2ayqpfIcb6sj6/6Oc6g2PFhHRgkr7hRrrc1hSjefIgK7H1oJ7pobjXokqzpe6PFd37GLMsHDB4aRQdOY9CVoXnwZGN7iZEt05J01a0+EbgdOO4JPG1wQ8va45ZMpUIhZe24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230057; c=relaxed/simple;
	bh=Cca7rncKDMFfrGSdHz8un6cdwbtSW4An46TcBCRlc08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ob3rZ+dT2bBzk1hzsNq2WIUGnkm7ZRDg7pL+uCjTVo0Cq8ZMoNfA+lzZDaUbd14V671fwptNSV70OTNgWf9ytEbrnT7vMKzJiZaq0JcBT9REGxJFSdJHFc84pZMM8x5oSfkJBcRsYhp5M+TX9Yt8w9qipsX2OqHD85GgE6zwA2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SHbUERaI; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SHbUERaI"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so3018755f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jul 2026 02:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785230053; x=1785834853; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ilY+h+8QGx0zVbomau5Tt3uzd/CQVsExBKQkL7A6VPw=;
        b=SHbUERaISPXsbBfnXcYu1fFDVk5OVE6Z0PvQA25q1sCx5PEd4n5gBTEWb7AxbZ4Av/
         Ezk8IfnhoB/mW6hpfPNkH6aEPsxql7pP0oTPOgVGlG6MQqyFgb/UgwlVTsNl/L4ALhtr
         4X95U2Jna846EDCUpo36xE1eOJMqKUK2djJzvPEHqdKjsYjH5+byAioxyhyBseZiRX/Z
         6frxqQoU6ta1IUYK+rBKWiRc50fdFRMAZOfKGBQSr1CoRgy3kxkEieddqf6RxC1ZUlXP
         HbMZyN+pepj8v4C25A2l9Ju7rgnq6J2De1VmsIV/yGwqZut0PHyNJG0+kXJBqV2Wih+F
         BWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230053; x=1785834853;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ilY+h+8QGx0zVbomau5Tt3uzd/CQVsExBKQkL7A6VPw=;
        b=bm5Eyi1VNcOISQZujPEd3PzlSnb4ClyYt9XKWYrMh4CAQylgspIx59CWKNYuILxJ0w
         POVw6zBypPuh4kEjjnE0UiS7b12W53fl4LzmPKtbFkp+w2FYeGExrQ6ToUXtRgtcymRy
         0676okB4+fRf/fgXGPfkeSDmGaD5EuvX+sKAkDV/ezNNN8rmxoV1CFHaotg5+K1hYSP8
         nC8J/1KNgyTS6i5yifKMwbLXBOKCXYQgam17C3lG6RafDX3qU3iWB2hVNe+v728Pmyz7
         267J9D9yUOkJNMilbhh0mguzqcAE5eomMb0zCQU932dSAT8dQlGBot9hkeSrEnzLHR59
         Su/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoWre+TrOoomC9yRCBEnh/6x4YGlz0iQL4N/pIX2C1Uvc9jKOkIWQxviNuWjM0e4wEciHHzB9DxnUFS5eU0VCa+sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+gAtsQ6AX0B963PM8PvNk7idLD0SQ3Dw2yZNcApSO4yzrA7qA
	/nbo4BKv1wiSaBx36Ky+w0A7XQqXjoAQ98K4T7ZohOm09amTUUEGQf6iF34ixdPRxJ8=
X-Gm-Gg: AR+sD13Joxk708V7x3kjAeZVyVAR5qlb78LNgFG5pzUMs2HMXWrzOAxKQf6WJffGZ9r
	INO2CvoaqR3VvLZnNHChXTWV8hmJ5GoNoowSG6pJShGA64XeznH4CGvXg82/aFqbUslA96Yd7Zo
	f+n+ms32qYpGg1JjQqIY33nNPWZuu9ni/gRLydAzVR08aQ8pk6kkjlMnmYTAtVpsvDQbolQyz6h
	xlcGj2aDIqpJ7zdjkUaIw5Ibsyd9woxaK9J9fqpHNaxdhIORWydrndEkdtyi4OCfmqWGsXdbmeg
	7rQytow8pALbAXz4CfqRMzscVg0VmIs+x51pJVN4fuOPerZPfZYjdwgXdTkcdC03kBywrCZCS+S
	nS4urNZQ0hLBDzqCKrVqufpRIiuh6gl8uX4ZoeiS/+Sh+XHfYubsGOLIpPP0XPdD6w+iIpEGpqk
	bjLs8ww8glmCDMYlTuYjGt4kY=
X-Received: by 2002:a05:6000:230d:b0:47f:9176:da23 with SMTP id ffacd0b85a97d-47fb1dcb89fmr1602020f8f.0.1785230053261;
        Tue, 28 Jul 2026 02:14:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm62253925f8f.1.2026.07.28.02.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:14:12 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 11:14:07 +0200
Subject: [PATCH v5] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8650-ayaneo-pocket-s2-display-dt-v5-1-892ab9bcecfe@linaro.org>
X-B4-Tracking: v=1; b=H4sIAN5yaGoC/5XPy27DIBAF0F+JWHciHgbbWfU/qi54jBPa2LhAr
 FqR/73EqZRWWXl5pcuZy5UkjB4TOeyuJOLkkw9DCfJlR+xJD0cE70omnHJFK95ADqO3kPpGSQp
 61gMGGIP9xAyJg/NpPOsZXAYpWmPqFk1NW1K4MWLnv9dTb+/3nC7mA22++b+NiF+XsiHfa8Toh
 GBD3/t82E31nkO0nNxen3zKIc7r7omt5e0TJwYMuo4Jbil1tFavZz/oGPYhHtcrE3/IkvMNMi+
 yda4qv0ep2bMsHnJNt8iiyKgcqsYJ0bXmSa7+yJxtkKsiqwZlp1sqlXb/5GVZfgC57nyGLQIAA
 A==
X-Change-ID: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 KancyJoe <kancy2333@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8121;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=09sMimcgX3oHb/BTtIVSz36b76/lgipJoHTP0UmOK6c=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaHLjE6O2UnMhsuOJ4W0dyGnrDPoXtP2qzFUQnIRW
 z3kBN/GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhy4wAKCRB33NvayMhJ0ZNrD/
 9RlYjI7GHCVTQ6nf/F6hHMhENIbosOp8ZUraWYWB5Ycju50NKqLV00p24AaeU5ZckvDOQJUeIjB8A2
 JH+fVVd/hNhaxM/WFBpIHbFZhv4x/f13d3teFkyy15pXk0mEWIifCGnR1Kkp+20WWZe/WEmplkVfu2
 J17Z53DC87Z7jfCf2R0GdVRaHzT5RW9JI+T0WVuV37syxWKEeOY6dAjtSGx7z4cDsaQSYvJrsHF81B
 rE1471vDwHAJpolSMhsM8kcirm5KaRUUVYHnti0llIv28pqDJXVbMcFKcD8qZObLoWHjbFYBIe6pTn
 kXUt/mVbjJV5WjnrVvlCkK0B0SamVNVG9IVwywnrYtjMDmr/5SJVdW+82SunyBBU0q0iSTyC34AnVV
 OMG0mAlThiLIbU3MYzzx5rF9DMZdc6hZ6zb6pX/NMtKyq31uf3iJkICHiHtbwzbGSzX4aCQPCzBmXK
 pf3id08fZPZb+QoDXr9YN2F2kzA2HRCMyy0+Rrb8BepvGk19tFGo+wFLH4FQN4UqH+1K3TFLAN12oY
 nFfQKOBxyvBH6S+HrpfrkCv7JVUYSR4pXa/3REDO8tOAJhIqMTdvkUXTCyTwC6ZqH/6shvSRTgqb2M
 E0zeNWlZp8s8PuHnlffvuYaE1FPXLPvd/T983oHcTIfm9JcnSIQHhdmiqUGA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: KancyJoe <kancy2333@outlook.com>

Add nodes for the dual DSI panel, the SGM3804 regulator, the
SY7758 backlight controller, the touch controller, and enable
the GPU to enable full display support.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Depends on follwing bindings, all applied into linux-next:
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v7-1-16edddda9951@linaro.org/
- https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
- https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
---
Changes in v5:
- Dropped unneeded mdp vsync pinctrl nodes
- Link to v4: https://patch.msgid.link/20260721-topic-sm8650-ayaneo-pocket-s2-display-dt-v4-1-68e5fa9056ad@linaro.org

Changes in v4:
- Reordered regulator & mdss nodes
- Moved zap shared firmware into separate node
- Link to v3: https://patch.msgid.link/20260702-topic-sm8650-ayaneo-pocket-s2-display-dt-v3-1-e6de68d33f9b@linaro.org

Changes in v3:
- renamed backlight label and node as "backlight"
- reordered pinctrl properties
- added regulator-boot-on to display regulators
- Link to v2: https://patch.msgid.link/20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org

Changes in v2:
- Update for bindings changes
- Remove empty line
- Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
---
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 230 +++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..e933cb35a515 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -325,6 +325,23 @@ platform {
 		};
 	};
 
+	sy7758_vdd33_reg: sy7758-vdd33-regulator {
+		compatible = "regulator-fixed";
+
+		regulator-name = "sy7758_vdd33";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+
+		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+
+		pinctrl-0 = <&sy7758_vdd33>;
+		pinctrl-names = "default";
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 
@@ -986,6 +1003,10 @@ gpu7_active: trip-active {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
 &i2c3 {
 	clock-frequency = <100000>;
 
@@ -1016,6 +1037,30 @@ wcd_usbss_sbu_mux: endpoint {
 	};
 };
 
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <162 IRQ_TYPE_EDGE_FALLING>;
+
+		reset-gpios = <&tlmm 161 GPIO_ACTIVE_HIGH>;
+		VDDIO-supply = <&vreg_l14b_3p2>;
+		AVDD28-supply = <&vreg_l14b_3p2>;
+
+		touchscreen-size-x = <1440>;
+		touchscreen-size-y = <2560>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_reset_default>, <&ts_irq_default>;
+	};
+};
+
 &i2c6 {
 	clock-frequency = <100000>;
 
@@ -1053,6 +1098,51 @@ redriver_ss_in: endpoint {
 	};
 };
 
+&i2c9 {
+	status = "okay";
+
+	/* Screen power */
+	regulator@3e {
+		compatible = "sgmicro,sgm3804";
+		reg = <0x3e>;
+
+		pinctrl-0 = <&sgm3804_default>;
+		pinctrl-names = "default";
+
+		vin-supply = <&vph_pwr>;
+
+		sgm3804_pos: pos {
+			regulator-name = "panel-avdd-pos";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
+		};
+
+		sgm3804_neg: neg {
+			regulator-name = "panel-avdd-neg";
+			regulator-min-microvolt = <5200000>;
+			regulator-max-microvolt = <5200000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 58 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* Backlight */
+	backlight: backlight@2e {
+		compatible = "silergy,sy7758";
+		reg = <0x2e>;
+
+		pinctrl-0 = <&sy7758_default>;
+		pinctrl-names = "default";
+
+		vdd-supply = <&sy7758_vdd33_reg>;
+		enable-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &iris {
 	status = "okay";
 };
@@ -1073,6 +1163,93 @@ &mdss_dp0_out {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	qcom,master-dsi;
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+
+	panel@0 {
+		status = "okay";
+		compatible = "ayaneo,wt0630-2k", "renesas,r63419";
+		reg = <0>;
+
+		pinctrl-0 = <&disp0_reset_n_active>;
+		pinctrl-1 = <&disp0_reset_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		vddio-supply = <&vreg_l12b_1p8>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vsp-supply = <&sgm3804_pos>;
+		vsn-supply = <&sgm3804_neg>;
+		vci-supply = <&vreg_l13b_3p0>;
+
+		backlight = <&backlight>;
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		rotation = <90>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				panel0_in_0: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1{
+				reg = <1>;
+				panel0_in_1: endpoint {
+					remote-endpoint = <&mdss_dsi1_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in_0>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
+&mdss_dsi1 {
+	vdda-supply = <&vreg_l3i_1p2>;
+
+	assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+	qcom,dual-dsi-mode;
+	qcom,sync-dual-dsi;
+
+	status = "okay";
+};
+
+&mdss_dsi1_out {
+	remote-endpoint = <&panel0_in_1>;
+
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi1_phy {
+	vdds-supply = <&vreg_l1i_0p88>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -1390,6 +1567,20 @@ sw-ctrl-pins {
 		};
 	};
 
+	disp0_reset_n_active: disp0-reset-n-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	fan_pwr_pins: fan-pwr-state {
 		pins = "gpio125";
 		function = "gpio";
@@ -1440,6 +1631,13 @@ gamepad_pwr_en: gamepad-pwr-en-active-state {
 		output-high;
 	};
 
+	sgm3804_default: sgm3804-default-state {
+		pins = "gpio58", "gpio59";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	spkr_23_sd_n_active: spkr-23-sd-n-active-state {
 		pins = "gpio77";
 		function = "gpio";
@@ -1454,6 +1652,34 @@ spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		bias-disable;
 	};
 
+	sy7758_default: sy7758-default-state {
+		pins = "gpio164";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sy7758_vdd33: sy7758-vdd33-state {
+		pins = "gpio163";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_irq_default: ts-irq-active-state {
+		pins = "gpio162";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	ts_reset_default: ts-reset-active-state {
+		pins = "gpio161";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio107";
 		function = "gpio";
@@ -1549,3 +1775,7 @@ &usb_dp_qmpphy_out {
 &xo_board {
 	clock-frequency = <76800000>;
 };
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8650/ayaneo/ps2/gen70900_zap.mbn";
+};

---
base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
change-id: 20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-539bb79eb709

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

